uses
  Crt;

const
  MAX_NODES = 100;

type
  TNode = record
    Data: Integer;
    Next: Integer;
    Prev: Integer;
  end;

var
  Head, Tail: Integer;
  NodeArray: array [1..MAX_NODES] of TNode;
  NodeCounter: Integer;Ы

procedure InsertNode(var Head, Tail: Integer; Data: Integer);
var
  Node: Integer;
begin
  Inc(NodeCounter);
  Node := NodeCounter;

  NodeArray[Node].Data := Data;
  NodeArray[Node].Next := 0;
  NodeArray[Node].Prev := 0;

  if Head = 0 then
  begin
    Head := Node;
    Tail := Node;
  end
  else
  begin
    NodeArray[Tail].Next := Node;
    NodeArray[Node].Prev := Tail;
    Tail := Node;
  end;
end;

procedure DeleteNode(var Head, Tail: Integer; Data: Integer);
var
  Node, PrevNode, NextNode: Integer;
begin
  Node := Head;

  while (Node <> 0) and (NodeArray[Node].Data <> Data) do
  begin
    Node := NodeArray[Node].Next;
  end;

  if Node <> 0 then
  begin
    PrevNode := NodeArray[Node].Prev;
    NextNode := NodeArray[Node].Next;

    if PrevNode <> 0 then
    begin
      NodeArray[PrevNode].Next := NextNode;
    end
    else
    begin
      Head := NextNode;
    end;

    if NextNode <> 0 then
    begin
      NodeArray[NextNode].Prev := PrevNode;
    end
    else
    begin
      Tail := PrevNode;
    end;

    Dec(NodeCounter);
  end;
end;

procedure PrintList(Head: Integer);
var
  Node: Integer;
begin
  Node := Head;

  while Node <> 0 do
  begin
    Write(NodeArray[Node].Data, ' ');
    Node := NodeArray[Node].Next;
  end;

  Writeln;
end;

var
  Choice: Integer;
  Data: Integer;

begin
  ClrScr;
  Head := 0;
  Tail := 0;
  NodeCounter := 0;

  repeat
    Writeln('Введите число:');
    Writeln('1. Ввод данных');
    Writeln('2. Удалить данные');
    Writeln('3. Напечатать список данных');
    Writeln('4. Выход из меню');
    Readln(Choice);

    case Choice of
      1: 
        begin
          Write('Введите данные: ');
          Readln(Data);
          InsertNode(Head, Tail, Data);
        end;
      2: 
        begin
          Write('Введите данные: ');
          Readln(Data);
          DeleteNode(Head, Tail, Data);
        end;
      3: 
        begin
          Writeln('Список данных:');
          PrintList(Head);
        end;
    end;
  until (Choice = 4);
end.
