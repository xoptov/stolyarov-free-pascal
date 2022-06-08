{ binary_tree.pas }
program BinaryTree;

type
  TreeNodePtr = ^TreeNode;
  TreeNode = record
    data: longint,
    left, right: TreeNodePtr
  end;

var
  root: TreeNodePtr = nil;

function SumTree(p: TreeNodePtr): longint;
begin
  if p = nil then
    SumTree := 0
  else
    SumTree := SumTree(p^.left) + p^.data + SumTree(p^.right)
end;

