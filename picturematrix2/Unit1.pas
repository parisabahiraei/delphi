unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  TypecastU, ImFilterU, ImagePrU, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    ImagePr1: TImagePr;
    imageFilter1: TimageFilter;
    TypeCast1: TTypeCast;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  matrix: TBitMat;
  bit: TBitmap;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute() then
  begin
    Image1.Picture.LoadFromFile(OpenDialog1.FileName);
  end;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var

  I: Integer;
  j: Integer;
begin
  bit := TBitmap.Create;
  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Image2Mat(bit, matrix);
//  for I := 0 to matrix.Pixels - 1 do
//    for j := 0 to matrix.Lines - 1 do
//    begin
//      //matrix.Red[j, I] := 0;
      imageFilter1.MirrorHX(matrix);
//    end;

//  bit.free;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
//var
//  bit: TBitmap;
begin

//  bit := TBitmap.Create;
//  bit.Assign(Image1.Picture.Graphic);
  ImagePr1.Mat2Image(matrix, bit);
  Image1.Picture.Bitmap.Assign(bit);

  bit.free;
end;

end.
