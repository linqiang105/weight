unit DrawLine1;

interface

uses Graphics, Classes, SysUtils, Controls, RzPanel;

//�ڵ�
type
  Node = ^Point;
  Point = record
    x: integer;
    y: Integer;
  end;

type TDrawLine1 = class
  private
  public
    //wΪ�����ܳ��ȣ�canvasΪ����,captionΪy���ֵ
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
  //��������˿�ȣ�ɾ�����ȵ��Ǹ�
  if (lineList.Count > (PWeight.Width div 5)) then
  begin
    lineList.Delete(0);
  end;
  //��ͷ��ʼ���������ػ�

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
