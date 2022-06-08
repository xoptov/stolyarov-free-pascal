program SOL;

type
    LongItemPtr = ^LongItem;
    LongItem = record
        data: longint;
        next: LongItemPtr;
    end;
    StackOfLongints = LongItemPtr;

procedure SOLInit(var stack: StackOfLongints);
begin
    stack := nil
end;

procedure SOLPush(var stack: StackOfLongints; n: longint);
var
    tmp: LongItemPtr;
begin
    new(tmp);
    tmp^.data := n;
    tmp^.next := stack;
    stack := tmp
end;

function SOLPop(var stack: StackOfLongints; var n: longint): boolean;
var
    tmp: LongItemPtr;
begin
    if stack = nil then
    begin
        SOLPop := false;
        // todo: чтобы почистить стэк необходимо пройтись по всем его элементам и почистить их.
        exit
    end;
    n := stack^.data;
    tmp := stack;
    stack := stack^.next;
    dispose(tmp);
    SOLPop := true
end;

function SOLIsEmpty(var stack: StackOfLongints): boolean;
begin
    SOLIsEmpty := stack = nil
end;

var
    s: StackOfLongints;
    n: longint;
begin
    SOLInit(s);
    while not eof do
    begin
        readln(n);
        SOLPush(s, n);
    end;
    while not SOLIsEmpty(s) do
    begin
        SOLPop(s, n);
        writeln(n);
    end;
end.
