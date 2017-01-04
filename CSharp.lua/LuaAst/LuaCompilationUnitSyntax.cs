using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace CSharpLua.LuaAst {
    public sealed class LuaCompilationUnitSyntax : LuaSyntaxNode {
        public string FilePath { get; set; }
        public readonly LuaSyntaxList<LuaStatementSyntax> Statements = new LuaSyntaxList<LuaStatementSyntax>();
        private LuaStatementListSyntax HeadAreaStatements = new LuaStatementListSyntax();
        private bool isImportLinq_;

        public LuaCompilationUnitSyntax() {
            var info = Assembly.GetExecutingAssembly().GetName();
            LuaShortCommentStatement versonStatement = new LuaShortCommentStatement($" Generated by {info.Name} Compiler {info.Version}");
            HeadAreaStatements.Statements.Add(versonStatement);

            var system = LuaIdentifierNameSyntax.System;
            AddImport(system, system);
            Statements.Add(HeadAreaStatements);
        }

        public void AddTypeDeclaration(LuaTypeDeclarationSyntax memberNode) {
            LuaNamespaceDeclarationSyntax namespaceNode = new LuaNamespaceDeclarationSyntax(LuaIdentifierNameSyntax.Empty);
            namespaceNode.Add(memberNode);
            Statements.Add(namespaceNode);
        }

        internal void ImportLinq() {
            if(!isImportLinq_) {
                AddImport(LuaIdentifierNameSyntax.Linq, LuaIdentifierNameSyntax.SystemLinqEnumerable);
                isImportLinq_ = true;
            }
        }

        public void AddImport(LuaIdentifierNameSyntax name, LuaExpressionSyntax value) {
            LuaVariableDeclaratorSyntax variableDeclarator = new LuaVariableDeclaratorSyntax(name);
            variableDeclarator.Initializer = new LuaEqualsValueClauseSyntax(value);
            HeadAreaStatements.Statements.Add(new LuaLocalVariableDeclaratorSyntax(variableDeclarator));
        }

        internal override void Render(LuaRenderer renderer) {
            renderer.Render(this);
        }
    }
}