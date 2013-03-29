unit DrawLine1;

interface

uses Graphics, Classes, SysUtils, Controls, RzPanel;

//节点
type
  Node = ^Point;
  Point = record
    x: integer;
    y: Integer;
  end;

type TDrawLine1 = class
  private
  public
    //w为画布总长度，canvas为画布,caption为y轴的值
    class procedure draw(control: TRzPanel);
  end;

implementation

var lineList: TList;

{ TDrawLine }

class procedure TDrawLine1.draw(control: TRzPanel);
var p, tmp: Node;
  i, j: integer;
  PWeight: TRzPanel;
begin
  PWeight := (control as TRzPanel);
  if lineList = nil then
  begin
    lineList := TList.Create;
  end;
  new(p);
  p.y := Trunc(StrToFloat(PWeight.Caption));
  lineList.Add(p);
  //如果超出了宽度，删掉最先的那个
  if (lineList.Count > (PWeight.Width div 5)) then
  begin
    lineList.Delete(0);
  end;
  //从头开始整个画布重画

  PWeight.Repaint;
  PWeight.DoubleBuffered := True;
  PWeight.Canvas.Lock;
  PWeight.Canvas.MoveTo(0, PWeight.Height);
  i := 0;
  j := 0;
  while i < lineList.Count do
  begin
    tmp := lineList.Items[i];
    tmp.x := j + 1;
    PWeight.Canvas.Pen.Color := clRed;
    PWeight.Canvas.LineTo(tmp.x, PWeight.Height - (tmp.y * PWeight.Height div 100000));
    i := i + 1;
    j := j + 5;
  end;
  PWeight.Canvas.UnLock;
end;

end.
