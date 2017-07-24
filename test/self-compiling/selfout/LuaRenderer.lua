-- Generated by CSharp.lua Compiler 1.0.0.0
local System = System
local CSharpLuaLuaAst
System.usingDeclare(function (global) 
  CSharpLuaLuaAst = CSharpLua.LuaAst
end)
System.namespace("CSharpLua", function (namespace) 
  namespace.class("LuaRenderer", function (namespace) 
    local getSetting, AddIndent, Outdent, WriteNewLine, WriteComma, WriteSpace, Write, Write1, 
    Render, Render1, Render2, Render3, Render4, Render5, Render6, WriteSeparatedSyntaxList, 
    WriteArgumentList, Render7, Render8, Render9, Render10, Render11, Render12, Render13, 
    Render14, Render15, WriteEquals, Render16, Render17, Render18, Render19, Render20, 
    Render21, Render22, Render23, Render24, Render25, Render26, Render27, Render28, 
    Render29, Render30, Render31, Render32, Render33, Render34, Render35, Render36, 
    Render37, Render38, Render39, Render40, Render41, Render42, Render43, Render44, 
    Render45, Render46, Render47, Render48, Render49, Render50, Render51, Render52, 
    Render53, Render54, Render55, Render56, Render57, Render58, __ctor__
    __ctor__ = function (this, generator, writer) 
      this.generator_ = generator
      this.writer_ = writer
    end
    getSetting = function (this) 
      return this.generator_.Setting
    end
    AddIndent = function (this) 
      this.indentLevel_ = this.indentLevel_ + 1
    end
    Outdent = function (this) 
      if this.indentLevel_ == 0 then
        System.throw(System.InvalidOperationException())
      end
      this.indentLevel_ = this.indentLevel_ - 1
    end
    WriteNewLine = function (this) 
      this.writer_:Write(10 --[['\n']])
      this.isNewLine_ = true
    end
    WriteComma = function (this) 
      Write(this, ", ")
    end
    WriteSpace = function (this) 
      Write(this, " ")
    end
    Write = function (this, value) 
      if this.isNewLine_ then
        do
          local i = 0
          while i < this.indentLevel_ do
            this.writer_:Write(getSetting(this).IndentString)
            i = i + 1
          end
        end
        this.isNewLine_ = false
      end
      this.writer_:Write(value)
    end
    Write1 = function (this, semicolonToken) 
      if getSetting(this).HasSemicolon then
        Write(this, semicolonToken:ToString())
      end
    end
    Render = function (this, node) 
      for _, statement in System.each(node.Statements) do
        statement:Render(this)
      end
    end
    Render1 = function (this, node) 
      node.Statement:Render(this)
    end
    Render2 = function (this, node) 
      node.Expression:Render(this)
      Write1(this, node:getSemicolonToken())
      WriteNewLine(this)
    end
    Render3 = function (this, node) 
      node.Expression:Render(this)
      Write(this, node.OperatorToken)
      node.Name:Render(this)
    end
    Render4 = function (this, node) 
      node.Expression:Render(this)
      node.ArgumentList:Render(this)
    end
    Render5 = function (this, node) 
      Write(this, node.ValueText)
    end
    Render6 = function (this, node) 
      Write(this, node:getPrefixToken())
      node.Name:Render(this)
    end
    WriteSeparatedSyntaxList = function (this, list) 
      local isFirst = true
      for _, node in System.each(list) do
        if isFirst then
          isFirst = false
        else
          WriteComma(this)
        end
        node:Render(this)
      end
    end
    WriteArgumentList = function (this, openParenToken, list, closeParenToken) 
      Write(this, openParenToken)
      WriteSeparatedSyntaxList(this, list)
      Write(this, closeParenToken)
    end
    Render7 = function (this, node) 
      WriteArgumentList(this, node:getOpenParenToken(), node.Arguments, node:getCloseParenToken())
    end
    Render8 = function (this, node) 
      node.Expression:Render(this)
    end
    Render9 = function (this, node) 
      Write(this, node:getFunctionKeyword())
      WriteSpace(this)
      node.ParameterList:Render(this)
      WriteSpace(this)
      node.Body:Render(this)
    end
    Render10 = function (this, node) 
      WriteArgumentList(this, node:getOpenParenToken(), node.Parameters, node:getCloseParenToken())
    end
    Render11 = function (this, node) 
      node.Identifier:Render(this)
    end
    Render12 = function (this, node) 
      Write(this, node.OpenBraceToken)
      WriteNewLine(this)
      AddIndent(this)
      for _, statement in System.each(node.Statements) do
        statement:Render(this)
      end
      Outdent(this)
      Write(this, node.CloseBraceToken)
    end
    Render13 = function (this, node) 
      Render12(this, node)
      WriteNewLine(this)
    end
    Render14 = function (this, node) 
      node.Identifier:Render(this)
    end
    Render15 = function (this, node) 
      Write(this, node:getOpenParenToken())
      node.Identifier:Render(this)
      Write(this, node:getCloseParenToken())
    end
    WriteEquals = function (this, count) 
      do
        local i = 0
        while i < count do
          Write(this, "=" --[[Tokens.Equals]])
          i = i + 1
        end
      end
    end
    Render16 = function (this, node) 
      Write(this, node:getOpenBracket())
      WriteEquals(this, node.EqualsCount)
      Write(this, node:getOpenBracket())
      Write(this, node:getText())
      Write(this, node:getCloseBracket())
      WriteEquals(this, node.EqualsCount)
      Write(this, node:getCloseBracket())
    end
    Render17 = function (this, node) 
      node.Value:Render(this)
      WriteSpace(this)
      Write(this, node:getOpenComment())
      Write(this, node.IdentifierToken)
      Write(this, node:getCloseComment())
    end
    Render18 = function (this, node) 
      for _, statement in System.each(node.Statements) do
        statement:Render(this)
      end
    end
    Render19 = function (this, node) 
      if #node.Variables > 0 then
        Write(this, node:getLocalKeyword())
        WriteSpace(this)
        WriteSeparatedSyntaxList(this, node.Variables)
        local default = node.Initializer
        if default ~= nil then
          default:Render(this)
        end
        Write1(this, node:getSemicolonToken())
        WriteNewLine(this)
      end
    end
    Render20 = function (this, node) 
      WriteSpace(this)
      Write(this, node:getEqualsToken())
      WriteSpace(this)
      WriteSeparatedSyntaxList(this, node.Values)
    end
    Render21 = function (this, node) 
      node.Left:Render(this)
      WriteSpace(this)
      Write(this, node:getOperatorToken())
      WriteSpace(this)
      node.Right:Render(this)
    end
    Render22 = function (this, node) 
      assert(#node.Lefts > 0 and #node.Rights > 0)
      WriteSeparatedSyntaxList(this, node.Lefts)
      WriteSpace(this)
      Write(this, node:getOperatorToken())
      WriteSpace(this)
      WriteSeparatedSyntaxList(this, node.Rights)
    end
    Render23 = function (this, node) 
      local isFirst = true
      for _, assignment in System.each(node.Assignments) do
        if isFirst then
          isFirst = false
        else
          Write1(this, CSharpLuaLuaAst.LuaSyntaxNode.Tokens.Semicolon)
          WriteSpace(this)
        end
        assignment:Render(this)
      end
    end
    Render24 = function (this, node) 
      Write(this, node:getReturnKeyword())
      if #node.Expressions > 0 then
        WriteSpace(this)
        WriteSeparatedSyntaxList(this, node.Expressions)
      end
      Write1(this, node:getSemicolonToken())
      WriteNewLine(this)
    end
    Render25 = function (this, node) 
      Write(this, node:getReturnKeyword())
      if node.Expression ~= nil then
        WriteSpace(this)
        node.Expression:Render(this)
      end
      Write1(this, node:getSemicolonToken())
      WriteNewLine(this)
    end
    Render26 = function (this, node) 
      Write(this, node:getOpenBraceToken())
      if #node.Items > 0 then
        WriteNewLine(this)
        AddIndent(this)
        local isFirst = true
        for _, itemNode in System.each(node.Items) do
          if isFirst then
            isFirst = false
          else
            WriteComma(this)
            WriteNewLine(this)
          end
          itemNode:Render(this)
        end
        Outdent(this)
        WriteNewLine(this)
      end
      Write(this, node:getCloseBraceToken())
    end
    Render27 = function (this, node) 
      node.Expression:Render(this)
    end
    Render28 = function (this, node) 
      node.Key:Render(this)
      WriteSpace(this)
      Write(this, node:getOperatorToken())
      WriteSpace(this)
      node.Value:Render(this)
    end
    Render29 = function (this, node) 
      Write(this, node:getOpenBracketToken())
      node.Expression:Render(this)
      Write(this, node:getCloseBracketToken())
    end
    Render30 = function (this, node) 
      node.Identifier:Render(this)
    end
    Render31 = function (this, node) 
      node.Expression:Render(this)
      Write(this, node:getOpenBracketToken())
      node.Index:Render(this)
      Write(this, node:getCloseBracketToken())
    end
    Render32 = function (this, node) 
      WriteSpace(this)
      Write(this, node:getEqualsToken())
      WriteSpace(this)
      node.Value:Render(this)
    end
    Render33 = function (this, node) 
      node.Declaration:Render(this)
    end
    Render34 = function (this, node) 
      if #node.Variables > 0 then
        local isFirst = true
        for _, variable in System.each(node.Variables) do
          if isFirst then
            isFirst = false
          else
            WriteSpace(this)
          end
          variable:Render(this)
        end
        WriteNewLine(this)
      end
    end
    Render35 = function (this, node) 
      Write(this, node:getLocalKeyword())
      WriteSpace(this)
      node.Identifier:Render(this)
      local default = node.Initializer
      if default ~= nil then
        default:Render(this)
      end
      Write1(this, node:getSemicolonToken())
    end
    Render36 = function (this, node) 
      node.Declarator:Render(this)
      WriteNewLine(this)
    end
    Render37 = function (this, node) 
      local kPerLineCount = 8
      if #node.Variables > 0 then
        Write(this, node:getLocalKeyword())
        WriteSpace(this)
        local count = 0
        for _, item in System.each(node.Variables) do
          if count > 0 then
            WriteComma(this)
            if count % kPerLineCount == 0 then
              WriteNewLine(this)
            end
          end
          item:Render(this)
          count = count + 1
        end
        Write1(this, node:getSemicolonToken())
        WriteNewLine(this)
      end
    end
    Render38 = function (this, node) 
      node.Left:Render(this)
      WriteSpace(this)
      Write(this, node.OperatorToken)
      WriteSpace(this)
      node.Right:Render(this)
    end
    Render39 = function (this, node) 
      Write(this, node:getIfKeyword())
      WriteSpace(this)
      node.Condition:Render(this)
      WriteSpace(this)
      Write(this, node:getOpenParenToken())
      node.Body:Render(this)
      for _, elseIfNode in System.each(node.ElseIfStatements) do
        elseIfNode:Render(this)
      end
      local default = node.Else
      if default ~= nil then
        default:Render(this)
      end
      Write(this, node:getCloseParenToken())
      WriteNewLine(this)
    end
    Render40 = function (this, node) 
      Write(this, node:getElseIfKeyword())
      WriteSpace(this)
      node.Condition:Render(this)
      WriteSpace(this)
      Write(this, node:getOpenParenToken())
      node.Body:Render(this)
    end
    Render41 = function (this, node) 
      Write(this, node:getElseKeyword())
      node.Body:Render(this)
    end
    Render42 = function (this, node) 
      Write(this, node.OperatorToken)
      WriteSpace(this)
      node.Operand:Render(this)
    end
    Render43 = function (this, node) 
      Write(this, node:getForKeyword())
      WriteSpace(this)
      node:getPlaceholder():Render(this)
      WriteComma(this)
      node.Identifier:Render(this)
      WriteSpace(this)
      Write(this, node:getInKeyword())
      WriteSpace(this)
      node.Expression:Render(this)
      WriteSpace(this)
      node.Body:Render(this)
      WriteNewLine(this)
    end
    Render44 = function (this, node) 
      Write(this, node:getForKeyword())
      WriteSpace(this)
      node.Identifier:Render(this)
      WriteSpace(this)
      Write(this, node:getEqualsToken())
      WriteSpace(this)
      node.StartExpression:Render(this)
      WriteComma(this)
      node.LimitExpression:Render(this)
      if node.StepExpression ~= nil then
        WriteComma(this)
        node.StepExpression:Render(this)
      end
      WriteSpace(this)
      node.Body:Render(this)
      WriteNewLine(this)
    end
    Render45 = function (this, node) 
      Write(this, node:getWhileKeyword())
      WriteSpace(this)
      node.Condition:Render(this)
      WriteSpace(this)
      node.Body:Render(this)
      WriteNewLine(this)
    end
    Render46 = function (this, node) 
      Write(this, node:getRepeatKeyword())
      node.Body:Render(this)
      Write(this, node:getUntilKeyword())
      WriteSpace(this)
      node.Condition:Render(this)
      Write1(this, node:getSemicolonToken())
      WriteNewLine(this)
    end
    Render47 = function (this, node) 
      node.RepeatStatement:Render(this)
    end
    Render48 = function (this, node) 
      Write(this, node:getBreakKeyword())
      Write1(this, node:getSemicolonToken())
      WriteNewLine(this)
    end
    Render49 = function (this, node) 
      node.Assignment:Render(this)
      node:getBreak():Render(this)
    end
    Render50 = function (this, node) 
      for i = 0, node.Count - 1 do
        WriteNewLine(this)
      end
    end
    Render51 = function (this, node) 
      Write(this, node:getSingleCommentToken())
      Write(this, node.Comment)
      WriteNewLine(this)
    end
    Render52 = function (this, node) 
      Write(this, node:getOpenCommentToken())
      Write(this, node.Comment)
      Write(this, node:getCloseCommentToken())
      WriteNewLine(this)
    end
    Render53 = function (this, node) 
      Write(this, node:getOpenParenToken())
      node.Expression:Render(this)
      Write(this, node:getCloseParenToken())
    end
    Render54 = function (this, node) 
      Write(this, node:getGotoKeyword())
      WriteSpace(this)
      node.Identifier:Render(this)
      Write1(this, node:getSemicolonToken())
      WriteNewLine(this)
    end
    Render55 = function (this, node) 
      Write(this, node:getPrefixToken())
      node.Identifier:Render(this)
      Write(this, node:getSuffixToken())
      Write1(this, node:getSemicolonToken())
      WriteNewLine(this)
      local default = node.Statement
      if default ~= nil then
        default:Render(this)
      end
    end
    Render56 = function (this, node) 
      node.Assignment:Render(this)
      node.GotoStatement:Render(this)
    end
    Render57 = function (this, node) 
      for _, code in System.each(node.Expressions) do
        code:Render(this)
      end
    end
    Render58 = function (this, node) 
      if node.Expression ~= nil then
        node.Expression:Render(this)
        Write(this, node.OperatorToken)
      end
      node.Name:Render(this)
      node.ArgumentList:Render(this)
    end
    return {
      isNewLine_ = false, 
      indentLevel_ = 0, 
      Render = Render, 
      Render1 = Render1, 
      Render2 = Render2, 
      Render3 = Render3, 
      Render4 = Render4, 
      Render5 = Render5, 
      Render6 = Render6, 
      Render7 = Render7, 
      Render8 = Render8, 
      Render9 = Render9, 
      Render10 = Render10, 
      Render11 = Render11, 
      Render12 = Render12, 
      Render13 = Render13, 
      Render14 = Render14, 
      Render15 = Render15, 
      Render16 = Render16, 
      Render17 = Render17, 
      Render18 = Render18, 
      Render19 = Render19, 
      Render20 = Render20, 
      Render21 = Render21, 
      Render22 = Render22, 
      Render23 = Render23, 
      Render24 = Render24, 
      Render25 = Render25, 
      Render26 = Render26, 
      Render27 = Render27, 
      Render28 = Render28, 
      Render29 = Render29, 
      Render30 = Render30, 
      Render31 = Render31, 
      Render32 = Render32, 
      Render33 = Render33, 
      Render34 = Render34, 
      Render35 = Render35, 
      Render36 = Render36, 
      Render37 = Render37, 
      Render38 = Render38, 
      Render39 = Render39, 
      Render40 = Render40, 
      Render41 = Render41, 
      Render42 = Render42, 
      Render43 = Render43, 
      Render44 = Render44, 
      Render45 = Render45, 
      Render46 = Render46, 
      Render47 = Render47, 
      Render48 = Render48, 
      Render49 = Render49, 
      Render50 = Render50, 
      Render51 = Render51, 
      Render52 = Render52, 
      Render53 = Render53, 
      Render54 = Render54, 
      Render55 = Render55, 
      Render56 = Render56, 
      Render57 = Render57, 
      Render58 = Render58, 
      __ctor__ = __ctor__
    }
  end)
end)
