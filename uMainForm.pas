unit uMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FMX.Controls.Presentation, FMX.StdCtrls, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.Edit, FMX.Layouts, FMX.WebBrowser, Registry;

type
  TMainForm = class(TForm)
    MaterialOxfordBlueSB: TStyleBook;
    Button1: TButton;
    Edit1: TEdit;
    WebBrowser1: TWebBrowser;
    Layout1: TLayout;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.Button1Click(Sender: TObject);
var
  lPdfDownload: TDownloadURL;
  lstream: TMemoryStream;
begin
  lPdfDownload := TDownloadURL.Create;
  lstream := TMemoryStream.Create;
  try
    lPdfDownload.DownloadRawBytes(
      'http://api.pdflayer.com/api/convert?access_key=d3039fac1479c2a8f468218db2262bce&document_url='+Edit1.Text,
      lstream
      );
    lstream.Position := 0;
    lstream.SaveToFile(ExtractFilePath(ParamStr(0)) + 'mypdf.pdf');
    WebBrowser1.URL := ExtractFilePath(ParamStr(0)) + 'mypdf.pdf';
  finally
    lstream.Free;
    lPdfDownload.Free;
  end;
end;


end.
