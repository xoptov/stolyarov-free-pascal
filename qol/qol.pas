program QOL;

type
  LongItemPtr = ^LongItem;
  LongItem = record
    data: lognint;
    next: LongItemPtr;
  end;
  QueueOfLongints = record
    first, last: LongItemPtr;
  end;

procedure QOLInit(var queue: QueueOfLongints);
begin
  queue.first := nil;
  queue.last := nil;
end;

procedure QOLEnqueue(var queue: QueueOfLongints; n: longint);
begin
  if queue.first = nil then
  begin
    new(queue.first);
    queue.last := queue.first
  end
  else
  begin
    new(queue.last^.next);
    queue.last := queue.last^.next
  end;
  queue.last^.data := n;
  queue.last^.next := nil
end;

function QOLDequeue(var queue: QueueOfLongints; n: longint): boolean;
var
  tmp: LongItemPtr;
begin
  if queue.first = nil then
  begin
    QOLDequeue := false;
    exit
  end;
  n := queue.first^.data;
  tmp := queue.first;
  if queue^.first = nil then
    queue^.last := nil;
  dispose(tmp);
  QOLDequeue := true;
end;

function QOLIsEmpty(var queue: QueueOfLongints): boolean;
begin
  QOLIsEmpty := queue^.first = nil;
end;
