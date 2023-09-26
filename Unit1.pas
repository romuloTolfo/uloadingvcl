unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ULoadingVcl;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, cont: integer;
begin
  cont := 0;
  TLoading.ShowLoad(form1, 'Fazendo update de produtos', 3000); // adicionar os milisegundos 3000 = 3s
  try
    for I := 0 to 100 - 1 do
    begin
      inc(cont);
      sleep(50);
      Tloading.Update('Carregando produtos : Produto Nº: ' + cont.tostring);
    end;
  finally
    tloading.Hide;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i, cont: integer;
  t : tthread;
begin
  cont := 0;
  
  t := tthread.CreateAnonymousThread(procedure
  begin
    // faça os procedimentos iniciais
  end);
  t.FreeOnTerminate := true;
  t.Start;

  t.Synchronize(t, procedure
  begin
    TLoading.ShowLoad(form1, 'Fazendo update de produtos com thread');
    sleep(1000);
  end);
  
  try
    for I := 0 to 1000 - 1 do
    begin    
      inc(cont);
      t.Synchronize(t, procedure
      begin
        sleep(50);                                              
        Tloading.Update('Carregando produtos com Thread : Produto Nº: ' + cont.tostring);
      end);
    end;
  finally
    t.Synchronize(t, procedure
    begin 
      tloading.Hide;
    end);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i, cont: integer;
begin
  cont := 0;
  TLoading.ShowLoad(form1, 'Fazendo update de produtos');
  for I := 0 to 10000 - 1 do
    begin
      inc(cont);
      sleep(50);
      Tloading.Update('Carregando produtos : Produto Nº: ' + cont.tostring);
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i, cont: integer;
begin
  cont := 0;
  TLoading.ShowLoad(form1, 'Fazendo update de produtos');
  try
    for I := 0 to 10000 - 1 do
    begin
      inc(cont);
      sleep(50);
      Tloading.Update('Carregando produtos : Produto Nº: ' + cont.tostring);
    end;
  finally
    tloading.Hide;
  end;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
//  Application.CreateForm(TForm2, form2)
end;

end.
