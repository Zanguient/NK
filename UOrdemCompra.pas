unit UOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants, ExtCtrls, DBCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, ComCtrls,
  Db, DBTables, RXLookup, Grids, DBGrids, RXDBCtrl, Menus, RXCtrls, DBFilter, ALed, rsDbUtils, ShellApi;

type
  TfOrdemCompra = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tOrdemCompraIns: TTable;
    GroupBox1: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    tOrdemCompraItemIns: TTable;
    tOrdemCompraItemInsItem: TIntegerField;
    tOrdemCompraInsCodigo: TIntegerField;
    tOrdemCompraItemInsCodigo: TIntegerField;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    CurrencyEdit4: TCurrencyEdit;
    StaticText7: TStaticText;
    CurrencyEdit5: TCurrencyEdit;
    StaticText8: TStaticText;
    DateEdit1: TDateEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton3: TSpeedButton;
    DBDateEdit1: TDBDateEdit;
    Label8: TLabel;
    DBText2: TDBText;
    StaticText9: TStaticText;
    tAuxOrdemCompra: TTable;
    tAuxOrdemCompraCodGrade: TIntegerField;
    tAuxOrdemCompraPosicao: TIntegerField;
    tAuxOrdemCompraQtd: TFloatField;
    tAuxOrdemCompraVlrUnitario: TFloatField;
    tAuxOrdemCompraVlrTotal: TFloatField;
    tAuxOrdemCompralkTamanho: TStringField;
    dsAuxOrdemCompra: TDataSource;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    BitBtn16: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    StaticText10: TStaticText;
    Edit3: TEdit;
    tGradeItem: TTable;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    StaticText11: TStaticText;
    GroupBox2: TGroupBox;
    ALed1: TALed;
    Label10: TLabel;
    ALed2: TALed;
    Label11: TLabel;
    ALed3: TALed;
    Label12: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    RxDBLookupCombo7: TRxDBLookupCombo;
    DBMemo1: TDBMemo;
    SpeedButton5: TSpeedButton;
    CurrencyEdit6: TCurrencyEdit;
    StaticText15: TStaticText;
    Label9: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tAuxOrdemCompraBeforeInsert(DataSet: TDataSet);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo1Click(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2CloseUp(Sender: TObject);
    procedure RxDBLookupCombo2DropDown(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure RxDBLookupCombo3DropDown(Sender: TObject);
    procedure RxDBLookupCombo3CloseUp(Sender: TObject);
    procedure RxDBLookupCombo4CloseUp(Sender: TObject);
    procedure RxDBLookupCombo4DropDown(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure RxDBLookupCombo6Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CurrencyEdit6Exit(Sender: TObject);
    procedure CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    Obs: Array [1..6] of String[126];
    vCodFornecedor, vItemOC : Integer;

    procedure Habilita;
    procedure Imprime_OrdemCompra;
    procedure Move_Itens;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrdemCompra: TfOrdemCompra;

implementation

uses UGrupos, UDM1, UFornecedores, UGrade, UCondPgto, UTransp, UMaterial, UOrdemCompraCor, Printers, UEscImpressora,
  UBaixaItOC, UConsFornecAtiv, UConsHistMat, UConsOrdemCompra, URelOrdemCompraMail, UProduto;

{$R *.DFM}


procedure TfOrdemCompra.Move_Itens;
begin
  CurrencyEdit1.Enabled   := not(DM1.tProdutoLancaGrade.AsBoolean);
  Edit3.Text := DM1.tProdutoUnidade.AsString;
  if BitBtn16.Tag = 0 then
    begin
      CurrencyEdit2.Value := DM1.tProdutoPrecoCusto.AsCurrency;
      CurrencyEdit3.Value := DM1.tProdutoPrecoCusto.AsCurrency;
      CurrencyEdit4.Value := DM1.tProdutoAliqIPI.AsCurrency;
    end;
end;

procedure TfOrdemCompra.Habilita;
begin
  Panel2.Enabled         := not(Panel2.Enabled);
  Panel4.Enabled         := not(Panel4.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn2.Enabled        := not(BitBtn2.Enabled);
  BitBtn3.Enabled        := not(BitBtn3.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn5.Enabled        := not(BitBtn5.Enabled);
  BitBtn6.Enabled        := not(BitBtn6.Enabled);
  RxSpeedButton2.Enabled := not(RxSpeedButton2.Enabled);
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  DBMemo1.ReadOnly       := not(DBMemo1.ReadOnly);
end;

procedure TfOrdemCompra.Imprime_OrdemCompra;
var
  F : TextFile;
  Linha, Pagina : integer;
  Texto1, Texto2, Texto3 : string;
procedure Cabecalho;                       
var
 i : Integer;
begin
  Pagina := Pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 66 do
        begin
          inc(linha);
          Writeln(F);
        end;
    end;
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  DM1.tEmpresa.First;
  Texto1 := ' ' + DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 80 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + '|          O R D E M    D E    C O M P R A';
  Writeln(F,Texto1);
  Texto1 := DM1.tEmpresaEndereco.AsString;
  Writeln(F,Format('%1s%s%'+IntToStr(59-Length(Texto1))+'s%s%s%6s%s',['',Texto1,'','CEP: ',DM1.tEmpresaCep.AsString,'','|']));
  Texto1 := ' FONE: ' +  DM1.tEmpresaTel.AsString;
  Texto2 := 'FAX: ' + DM1.tEmpresaFax.AsString;
  Texto3 := ' No. ' + DM1.tOrdemCompraCodigo.AsString;
  Writeln(F,Format('%s%'+IntToStr(60-Length(Texto1))+'s%s%'+IntToStr(20-Length(Texto2))+'s%s%s',[Texto1,'',Texto2,'','|',Texto3]));
  Texto1 := ' ' +  DM1.tEmpresaCidade.AsString;
  Texto2 := 'Estado: ' +DM1.tEmpresaEstado.AsString;
  Writeln(F,Format('%s%'+IntToStr(57-length(Texto1))+'s%s%13s%s',[Texto1,'',Texto2,'','|']));
  Texto1 := ' CNPJ: ' +  DM1.tEmpresaCgc.AsString;
  Texto2 := 'INSCR.EST.: ' + DM1.tEmpresaInscr.AsString;
  Texto3 := 'Pagina: ' + IntToStr(Pagina);
  Writeln(F,Format('%s%'+IntToStr(53-length(Texto1))+'s%s%'+IntToStr(27-length(Texto2))+'s%s%s%'+IntToStr(10-Length(DM1.tOrdemCompraDtEmissao.AsString))+'s%4s%s%s%'+IntToStr(31-length(Texto3))+'s',
         [Texto1,'',Texto2,'','|',' Data de Emissao: ',DM1.tOrdemCompraDtEmissao.AsString,'','',Texto3,'','|']));
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := ' Fornecedor: ' + DM1.tOrdemCompralkFornecedor.AsString;
  Texto2 := 'Telefone: ' + DM1.tOrdemCompralkFone.AsString;
  Writeln(F,Format('%s%'+IntToStr(55-Length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Texto1 := '   Endereco: ' + DM1.tOrdemCompralkEnd.AsString;
  Texto2 := 'Cep: ' + DM1.tOrdemCompralkCep.AsString;
  Writeln(F,Format('%s%'+IntToStr(60-length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Writeln(F,Format('%s%s',['     Bairro: ',DM1.tOrdemCompralkBairro.AsString]));
  Texto1 := '     Cidade: ' + DM1.tOrdemCompralkCidade.AsString;
  Texto2 := ' Estado: '+ DM1.tOrdemCompralkEstado.AsString;
  Writeln(F,Format('%s%'+IntToStr(56-Length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  // Imprime dados da transportadora
  DM1.tTransp.IndexFieldNames := 'Codigo';
  DM1.tTransp.FindKey([DM1.tOrdemCompraCodTransp.AsInteger]);
  Texto1 := ' Transportador: ' + DM1.tOrdemCompralkNomeTransp.AsString;
  for i := 1 to 62 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Telefone: ' + DM1.tOrdemCompralkFoneTransp.AsString;
  Writeln(F,Texto1);
  Texto1 := '      Endereco: ' + DM1.tOrdemCompralkEndTransp.AsString;
  for i := 1 to 67 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto2 := 'Cep: ' + DM1.tOrdemCompralkCepTransp.AsString;
  for i := 1 to 25 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + 'Bairro: ' + DM1.tOrdemCompralkBairroTransp.AsString;
  Writeln(F,Texto1);
  Texto1 := '        Cidade: ' + DM1.tOrdemCompralkCidTransp.AsString;
  for i := 1 to 64 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Estado: ' + DM1.tOrdemCompralkUfTransp.AsString;
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'                                          Itens da Ordem de Compra');
  //Writeln(F,'It. Nome Produto                              Larg. Nome da Cor     Dt.Entrega       Quantidade  Unid.   Vlr.Unitario    Valor Total');
  Writeln(F,'It. Codigo Nome Produto                   Dt.Entrega          Quantidade  Unid.  %IPI      Vlr.IPI  Vlr.Unitario    Valor Total');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Linha := 0;
end;
procedure Detalhes;
var
  i : Integer;
  Texto2, Texto3, Texto4 : String;
begin
 DM1.tOrdemCompraItem.First;
 while not DM1.tOrdemCompraItem.EOF do
   begin
     if Linha > 61 then
       begin
         Cabecalho;
         Write(F,#15);
       end;
     texto1 := '';
     texto2 := DM1.tOrdemCompraItemItem.AsString;
     for i := 1 to 3 - length(texto2) do
       Texto2 := ' ' + Texto2;
     texto1 := texto2 + ' ';

     texto2 := DM1.tOrdemCompraItemCodMaterial.AsString;
     for i := 1 to 6 - length(texto2) do
       Texto2 := ' ' + Texto2;
     texto1 := texto1 + texto2 + ' ';

     texto2 := DM1.tOrdemCompraItemlkNomeMaterial.AsString;
     for i := 1 to 50 - length(texto2) do
       Texto2 := Texto2 + ' ';
     texto1 := texto1 + texto2 + '  ';

     texto2 := DM1.tOrdemCompraItemlkReferencia.AsString;
     for i := 1 to 22 - length(texto2) do
       Texto2 := Texto2 + ' ';
     texto1 := texto1 + texto2 + '  ' + DM1.tOrdemCompraItemlkNomeCor.AsString;

     Writeln(F,texto1);
     Linha := Linha + 1;

     texto1 := '           ...............................';
     texto2 := DM1.tOrdemCompraItemDtEntrega.AsString;
     for i := 1 to 10 - Length(texto2) do
       texto2 := ' ' + texto2;
     texto1 := texto1 + texto2 + '   ';

     Texto2 := FormatFloat('###,###,##0.00000',DM1.tOrdemCompraItemQtd.AsFloat);
     for i := 1 to 17 - length(Texto2) do
       Texto2 := ' ' + Texto2;                      
     texto1 := texto1 + texto2 + '   ';

     texto2 := DM1.tOrdemCompraItemUnidade.AsString;
     for i := 1 to 3 - length(Texto2) do
       Texto2 := Texto2 + ' ';
     texto1 := texto1 + texto2 + '  ';

     texto2 := FormatFloat('#0.00',DM1.tOrdemCompraItemAliqIPI.AsFloat);
     for i := 1 to 5 - length(Texto2) do
       Texto2 := ' ' + Texto2;
     texto1 := texto1 + texto2 + '  ';

     texto2 := FormatFloat('###,##0.00',DM1.tOrdemCompraItemVlrIPI.AsFloat);
     for i := 1 to 10 - length(Texto2) do
       Texto2 := ' ' + Texto2;
     texto1 := texto1 + texto2 + ' ';

     texto2 := FormatFloat('###,###,##0.00',DM1.tOrdemCompraItemVlrUnitario.AsFloat);
     for i := 1 to 14 - length(Texto2) do
       Texto2 := ' ' + Texto2;
     texto1 := texto1 + texto2 + ' ';

     texto2 := FormatFloat('###,###,##0.00',DM1.tOrdemCompraItemVlrTotal.AsFloat);
     for i := 1 to 14 - length(Texto2) do
       Texto2 := ' ' + Texto2;
     texto1 := texto1 + texto2 + ' ';
     Writeln(F,texto1);
     Linha := Linha + 1;

     if DM1.tOrdemCompraItemObs.AsString <> '' then
       begin
         texto1 := '           ...Observa��o: ' + DM1.tOrdemCompraItemObs.AsString;
         Writeln(F,texto1);
         Linha := Linha + 1;
       end;

     if not DM1.tOrdemCompraItemGrade.IsEmpty then
       begin
         if DM1.tOrdemCompraItemlkLargura.AsString = '' then
           texto3 := ' '
         else
           texto3 := DM1.tOrdemCompraItemlkLargura.AsString;
         texto3 := '     ' + texto3 + '  Tam:';
         Texto2 := '';
         Texto4 := '        Qtd:';
         DM1.tOrdemCompraItemGrade.First;
         while not DM1.tOrdemCompraItemGrade.EOF do
           begin
             DM1.tGrade.IndexFieldNames := 'Codigo';
             DM1.tGrade.FindKey([DM1.tOrdemCompraItemGradeCodGrade.AsInteger]);
             if DM1.tOrdemCompraItemGradeQtd.AsInteger > 0 then
               begin
                 Texto2 := '';
                 if tGradeItem.Locate('CodGrade;Posicao',VarArrayOf([DM1.tOrdemCompraItemGradeCodGrade.AsInteger,DM1.tOrdemCompraItemGradePosicao.AsInteger]),[loCaseInsensitive]) then
                   Texto2 := tGradeItemTamanho.AsString;
                 for i := 1 to 4 - length(Texto2) do
                   texto2 := ' ' + texto2;
                 Texto3 := Texto3 + ' ' + Texto2;
                 Texto2 := DM1.tOrdemCompraItemGradeQtd.AsString;
                 for i := 1 to 4 - length(DM1.tOrdemCompraItemGradeQtd.AsString) do
                   Texto2 := ' ' + texto2;
                 texto4 := texto4 + ' ' + texto2;
               end;
             DM1.tOrdemCompraItemGrade.Next
           end;
         Writeln(F,texto3);
         Writeln(F,texto4);
         Linha := Linha + 2;
       end;
     DM1.tOrdemCompraItem.Next;
   end;
end;
procedure Sumario;
var
  Texto1, Texto2 : String;
  i : Integer;
  T : Integer;
begin
  if linha > 53 then
    cabecalho;
  Texto1 := '';
  Texto1 := Texto1 + '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := 'Condicao de Pagamento.: ' + DM1.tOrdemCompralkCondsPgto.AsString;
  Writeln(F,Texto1);
  Texto1 := '';
  Texto1 := '';
  Texto2 := '';
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := 'Observacoes';
  Texto2 := '| Total R$: ' + FormatFloat('###,###,##0.00',DM1.tOrdemCompraVlrTotal.AsFloat);
  Writeln(F,Format('%s%'+IntToStr(104-Length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := '';
  Texto2 := '';
  T := 1;
  for i := 1 to 650 do
    begin
      Texto2 := Copy(DM1.tOrdemCompraObs.AsString,i,1);
      if (Texto2 = #$D) or (Texto2 = #$A) then
        Texto1 := Texto1 + ' '
      else
        Texto1 := Texto1 + Copy(DM1.tOrdemCompraObs.AsString,i,1);
    end;
  for i := 1 to 6 do
    begin
      Obs[i] := Copy(Texto1,T, 126);
      T      := T + 126;
    end;
  for i := 1 to 6 do
    Writeln(F,'  ' + Obs[i]);
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Writeln(F,Format('%s',['DEVE CONSTAR O NUMERO DA ORDEM DE COMPRA NA NOTA FISCAL E O ITEM']));
  Writeln(F);
  Writeln(F);
  Writeln(F);
  Writeln(F);
  Writeln(F);
  Texto1 := '  ----------------------------------------------------------           ----------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := '                          Fornecedor                                                          Comprador';
  Writeln(F,Texto1);
end;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  Pagina := 0;
  Cabecalho;
  Detalhes;
  Sumario;
  CloseFile(F);
  DM1.tPedido.Edit;
  DM1.tPedidoImpresso.AsBoolean := True;
  DM1.tPedido.Post;
  if DM1.tImpressoraVisualizar.AsBoolean then
    Begin
      Texto2 := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto2),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;  
end;

procedure TfOrdemCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oDBUtils.OpenTables(True,Self);
  DM1.tOrdemCompra.Filtered  := False;
  Dm1.tFornecedores.Filtered := False;
  RxDBFilter1.Active         := False;
  Action                     := Cafree;
end;

procedure TfOrdemCompra.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfOrdemCompra.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      RxDBFilter1.Active := False;
      DM1.tFornecedores.Refresh;
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
      RxDBFilter1.Active := True;
      DM1.tFornecedores.Refresh;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir formul�rio de fornecedores!');
end;

procedure TfOrdemCompra.BitBtn1Click(Sender: TObject);
begin
  BitBtn2.Tag := 0;
  if DM1.tUsuarioInsOrdemCompra.AsBoolean then
    begin
      DM1.tOrdemCompra.IndexFieldNames := 'Codigo';
      tOrdemCompraIns.IndexFieldNames  := 'Codigo';
      DM1.tOrdemCompra.Refresh;
      tOrdemCompraIns.Refresh;
      tOrdemCompraIns.Last;
      DM1.tOrdemCompra.Insert;
      DM1.tOrdemCompraCodigo.AsInteger := tOrdemCompraInsCodigo.AsInteger + 1;
      DM1.tOrdemCompra.Post;
      DM1.tOrdemCompra.Edit;
      StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
      DM1.tOrdemCompraDtEmissao.AsDateTime := Date();
      vItemOC      := 0;
      BitBtn16.Tag := 0;
      Habilita;
      RxDBLookupCombo2.SetFocus;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a fazer inser��o!');
end;

procedure TfOrdemCompra.BitBtn2Click(Sender: TObject);
begin
  BitBtn2.Tag := 1;
  DM1.tOrdemCompra.IndexFieldNames := 'Codigo';
  vItemOC      := 0;
  BitBtn16.Tag := 0;
  if DM1.tUsuarioAltOrdemCompra.AsBoolean then
    begin
      DM1.tOrdemCompra.Edit;
      Habilita;
      RxDBLookupCombo2.SetFocus;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a fazer altera��o!');
end;

procedure TfOrdemCompra.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tOrdemCompraItem.First;
      while not DM1.tOrdemCompraItem.Eof do
        begin
          DM1.tOrdemCompraItemGrade.First;
          while not DM1.tOrdemCompraItemGrade.Eof do
            DM1.tOrdemCompraItemGrade.Delete;
          DM1.tOrdemCompraItem.Delete;
        end;
//      if MessageDlg('Deseja excluir esta ordem de compra?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
      DM1.tOrdemCompra.Delete;
    end;
  DM1.tOrdemCompra.Cancel;
  Habilita;
  RxDBLookupCombo5.ClearValue;
  RxDBLookupCombo6.ClearValue;
  RxDBLookupCombo7.ClearValue;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  DateEdit1.Clear;
  BitBtn2.Tag := 0;
end;

procedure TfOrdemCompra.BitBtn3Click(Sender: TObject);
var
  vExcluir : Boolean;
begin
  if DM1.tUsuarioExcOrdemCompra.AsBoolean then
    begin
      if DM1.tOrdemCompraEntregue.AsBoolean then
        vExcluir := False
      else
        begin
          vExcluir := True;
          DM1.tOrdemCompraItem.First;
          while not DM1.tOrdemCompraItem.Eof do
            begin
              if DM1.tOrdemCompraItemQtdEntregue.AsFloat > 0 then
                begin
                  vExcluir := False;
                  DM1.tOrdemCompraItem.Last;
                end;
              DM1.tOrdemCompraItem.Next;
            end;
        end;
      if vExcluir then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            begin
              DM1.tOrdemCompraItem.First;
              while not DM1.tOrdemCompraItem.Eof do
                begin
                  DM1.tOrdemCompraItemGrade.First;
                  while not DM1.tOrdemCompraItemGrade.Eof do
                    DM1.tOrdemCompraItemGrade.Delete;
                  DM1.tOrdemCompraItem.Delete;
                end;
              DM1.tOrdemCompra.Delete;
              StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
            end
        end
      else
        ShowMessage('Ordem de compra ja foi entregue!');
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a fazer exclus�o!');
end;

procedure TfOrdemCompra.BitBtn5Click(Sender: TObject);
var
  vEntregue : Boolean;
begin
  BitBtn2.Tag := 0;
  if DM1.tOrdemCompra.State in [dsEdit,dsInsert] then
    begin
      vEntregue := True;
      DM1.tOrdemCompraItem.First;
      while not DM1.tOrdemCompraItem.Eof do
        begin
          if DM1.tOrdemCompraItemQtdRestante.AsFloat > 0 then
            vEntregue := False;
          DM1.tOrdemCompraItem.Next;
        end;
      DM1.tOrdemCompraEntregue.AsBoolean := vEntregue;
      DM1.tOrdemCompra.Post;
      StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
      Habilita;
      BitBtn1.SetFocus;
    end;
end;

procedure TfOrdemCompra.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioCondPgto.AsBoolean then
    begin
      fCondPgto := TfCondPgto.Create(Self);
      fCondPgto.ShowModal;
      DM1.tCondPgto.Refresh;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir formul�rio de cond.pagto.!');
end;

procedure TfOrdemCompra.DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  DM1.tOrdemCompra.IndexFieldNames := 'Codigo';
end;

procedure TfOrdemCompra.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tOrdemCompra.State in [dsEdit] then
    begin
      ShowMessage('Voc� deve Cancelar ou Confirmar a ordem de compra antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfOrdemCompra.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F9) then
    begin
      if DM1.tUsuarioConsFornecAtiv.AsBoolean then
        begin
          fConsFornecAtiv := TfConsFornecAtiv.Create(Self);
          fConsFornecAtiv.ShowModal;
        end
      else
        ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir formul�rio de Consulta de fornecedores!');
    end;
  if (Key = Vk_F8) then
    begin
      fConsHistMat := TfConsHistMat.Create(Self);
      fConsHistMat.ShowModal;
    end;
  if (Key = Vk_F2) then
    begin
      fConsOrdemCompra := TfConsOrdemCompra.Create(Self);
      fConsOrdemCompra.ShowModal;
    end;
end;

procedure TfOrdemCompra.BitBtn7Click(Sender: TObject);
begin
  if RxDBLookupCombo5.Text = '' then
    ShowMessage('H� campos em branco!')
  else
    begin
      DM1.tProduto.IndexFieldNames := 'Codigo';
      DM1.tProduto.FindKey([RxDBLookupCombo5.KeyValue]);
      DM1.tOrdemCompraItem.Refresh;
      tOrdemCompraItemIns.Refresh;
      tOrdemCompraItemIns.Last;
      DM1.tOrdemCompraItem.Insert;
      DM1.tOrdemCompraItemCodigo.AsInteger      := DM1.tOrdemCompraCodigo.AsInteger;
      if BitBtn16.Tag = 1 then
        DM1.tOrdemCompraItemItem.AsInteger  := vItemOC
      else
        DM1.tOrdemCompraItemItem.AsInteger        := tOrdemCompraItemInsItem.AsInteger + 1;
      DM1.tOrdemCompraItemCodMaterial.AsInteger := RxDBLookupCombo5.KeyValue;
      if RxDBLookupCombo6.Text <> '' then
        DM1.tOrdemCompraItemCodCor.AsInteger    := RxDBLookupCombo6.KeyValue
      else
        DM1.tOrdemCompraItemCodCor.AsInteger    := 0;
      DM1.tOrdemCompraItemQtd.AsFloat           := CurrencyEdit1.Value;
      DM1.tOrdemCompraItemUnidade.AsString      := Edit3.Text;
      DM1.tOrdemCompraItemQtdRestante.AsFloat   := CurrencyEdit1.Value;
      DM1.tOrdemCompraItemQtdEntregue.AsFloat   := 0;
      DM1.tOrdemCompraItemVlrUnitario.AsFloat   := CurrencyEdit2.Value;
      DM1.tOrdemCompraItemAliqIpi.AsFloat       := CurrencyEdit4.Value;
      DM1.tOrdemCompraItemVlrIpi.AsFloat        := CurrencyEdit5.Value;
      if DateEdit1.Text = '  /  /    ' then
        DM1.tOrdemCompraItemDtEntrega.Clear
      else
        DM1.tOrdemCompraItemDtEntrega.AsDateTime  := DateEdit1.Date;
      DM1.tOrdemCompraItemVlrTotal.AsFloat      := CurrencyEdit2.Value * CurrencyEdit1.Value;
      DM1.tOrdemCompraVlrTotal.AsFloat          := DM1.tOrdemCompraVlrTotal.AsFloat +
                                                   DM1.tOrdemCompraItemVlrTotal.AsFloat;
      tAuxOrdemCompra.First;
      if not tAuxOrdemCompra.IsEmpty then
        DM1.tOrdemCompraItemCodGrade.AsInteger    := tAuxOrdemCompraCodGrade.AsInteger
      else
        DM1.tOrdemCompraItemCodGrade.AsInteger    := 0;
      DM1.tOrdemCompraItemObs.AsString := Edit1.Text;
      DM1.tOrdemCompraItem.Post;
      // grava a grade nos itens
      if DM1.tProdutoLancaGrade.AsBoolean then
        begin
          tAuxOrdemCompra.First;
          while not tAuxOrdemCompra.Eof do
            begin
              DM1.tOrdemCompraItemGrade.Insert;
              DM1.tOrdemCompraItemGradeCodigo.AsInteger      := DM1.tOrdemCompraCodigo.AsInteger;
              DM1.tOrdemCompraItemGradeItem.AsInteger        := DM1.tOrdemCompraItemItem.AsInteger;
              DM1.tOrdemCompraItemGradeCodGrade.AsInteger    := tAuxOrdemCompraCodGrade.AsInteger;
              DM1.tOrdemCompraItemGradePosicao.AsInteger     := tAuxOrdemCompraPosicao.AsInteger;
              DM1.tOrdemCompraItemGradeQtd.AsFloat           := tAuxOrdemCompraQtd.asFloat;
              DM1.tOrdemCompraItemGradeQtdRestante.AsFloat   := tAuxOrdemCompraQtd.asFloat;
              DM1.tOrdemCompraItemGradeQtdEntregue.AsFloat   := 0;
              DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat   := tAuxOrdemCompraVlrUnitario.asFloat;
              DM1.tOrdemCompraItemGradeVlrTotal.AsFloat      := tAuxOrdemCompraQtd.AsFloat * tAuxOrdemCompraVlrUnitario.asFloat;
              DM1.tOrdemCompraItemGrade.Post;
              tAuxOrdemCompra.Next;
            end;
          DM1.tOrdemCompraItem.Refresh;
          DM1.tOrdemCompraItemGrade.Refresh;
          tAuxOrdemCompra.First;
          while not tAuxOrdemCompra.Eof do
            tAuxOrdemCompra.Delete;
        end;
      // fim da grava��o da grade
      BitBtn8Click(Sender);
      CurrencyEdit6.SetFocus;
    end;
end;

procedure TfOrdemCompra.BitBtn8Click(Sender: TObject);
begin
  RxDBLookupCombo5.ClearValue;
  RxDBLookupCombo6.ClearValue;
  RxDBLookupCombo7.ClearValue;
  Edit1.Clear;
  Edit3.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  CurrencyEdit6.Clear;
  DateEdit1.Clear;
  vItemOC      := 0;
  BitBtn16.Tag := 0;
end;

procedure TfOrdemCompra.BitBtn9Click(Sender: TObject);
begin
  if (not DM1.tOrdemCompraItem.IsEmpty) and (DM1.tOrdemCompraItemQtdEntregue.AsFloat <= 0) then
    begin
      if MessageDlg('Deseja realmente excluir este item ?',mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DM1.tOrdemCompraVlrTotal.AsFloat  := DM1.tOrdemCompraVlrTotal.AsFloat -
                                               DM1.tOrdemCompraItemVlrTotal.AsFloat;
          DM1.tOrdemCompraItemGrade.First;
          while not DM1.tOrdemCompraItemGrade.Eof do
            DM1.tOrdemCompraItemGrade.delete;
          DM1.tOrdemCompraItem.Delete;
        end;
    end
  else
    ShowMessage('N�o h� registro p/ ser exclu�do, ou item ja entregue!');
end;

procedure TfOrdemCompra.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := CurrencyEdit2.Value * CurrencyEdit1.Value;
end;

procedure TfOrdemCompra.SpeedButton4Click(Sender: TObject);
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      fTransp := TfTransp.Create(Self);
      fTransp.ShowModal;
      DM1.tTransp.Refresh;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir formul�rio de transportadora!');
end;

procedure TfOrdemCompra.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      DM1.tProduto.Refresh;
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
      DM1.tProduto.Refresh;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir formul�rio de Material!');
end;

procedure TfOrdemCompra.tAuxOrdemCompraBeforeInsert(DataSet: TDataSet);
var
 icount : integer;
begin
  icount := fOrdemCompra.tAuxOrdemCompra.RecordCount;
  if icount >= DM1.tGradeItem.RecordCount then
    begin
      fOrdemCompraCor.BitBtn5.SetFocus;
      Abort;
    end;
end;

procedure TfOrdemCompra.Imprimir1Click(Sender: TObject);
var
  NumOrd : integer;
begin
  case RadioGroup1.ItemIndex of
    0 : Imprime_OrdemCompra;
    1 : begin
          NumOrd := DM1.tOrdemCompraCodigo.AsInteger;
          Dm1.tFornecedores.Filtered := False;
          Dm1.tFornecedores.Filter   := 'CodForn = '''+IntToStr(Dm1.tOrdemCompraCodFornecedor.AsInteger)+'''';
          Dm1.tFornecedores.Filtered := True;

          DM1.tOrdemCompra.Filtered  := False;
          DM1.tOrdemCompra.Filter    := 'Codigo = '''+IntToStr(NumOrd)+'''';
          DM1.tOrdemCompra.Filtered  := True;

          fRelOrdemCompraMail := TfRelOrdemCompraMail.Create(Self);
          fRelOrdemCompraMail.RLReport1.Preview;
          fRelOrdemCompraMail.RLReport1.Free;
          FreeAndNil(fRelOrdemCompraMail);
          DM1.tOrdemCompra.Filtered  := False;
          Dm1.tFornecedores.Filtered := False;
          DM1.tOrdemCompra.FindKey([NumOrd]);
        end;
  end;
end;

procedure TfOrdemCompra.Visualizar1Click(Sender: TObject);
var
  NumOrd : integer;
begin
  NumOrd := DM1.tOrdemCompraCodigo.AsInteger;
  Dm1.tFornecedores.Filtered := False;
  Dm1.tFornecedores.Filter   := 'CodForn = '''+IntToStr(Dm1.tOrdemCompraCodFornecedor.AsInteger)+'''';
  Dm1.tFornecedores.Filtered := True;

  DM1.tOrdemCompra.Filtered  := False;
  DM1.tOrdemCompra.Filter    := 'Codigo = '''+IntToStr(NumOrd)+'''';
  DM1.tOrdemCompra.Filtered  := True;

  vFormulario := 'OC';

  fRelOrdemCompraMail := TfRelOrdemCompraMail.Create(Self);
  fRelOrdemCompraMail.RLReport1.Preview;
  fRelOrdemCompraMail.RLReport1.Free;
  FreeAndNil(fRelOrdemCompraMail);
  DM1.tOrdemCompra.Filtered  := False;
  DM1.tFornecedores.Filtered := False;
  DM1.tOrdemCompra.FindKey([NumOrd]);
end;

procedure TfOrdemCompra.PopupMenu1Popup(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : PopupMenu1.Items.Items[1].Enabled := False;
    1 : PopupMenu1.Items.Items[1].Enabled := True;
  end;
end;

procedure TfOrdemCompra.Edit2Change(Sender: TObject);
begin
  try
    DM1.tOrdemCompra.IndexFieldNames := 'Codigo';
    DM1.tOrdemCompra.FindKey([Edit2.Text]);
    StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
  except
    ShowMessage('Digite s� n�meros aqui!');
  end;
end;

procedure TfOrdemCompra.BitBtn16Click(Sender: TObject);
begin
  if (not DM1.tOrdemCompraItem.IsEmpty) and (DM1.tOrdemCompraItemQtdEntregue.AsFloat <= 0) then
    begin
      if RxDBLookupCombo5.Text = '' then
        begin
          BitBtn16.Tag := 1;
          vItemOC                          := DM1.tOrdemCompraItemItem.AsInteger;
          if DM1.tOrdemCompraItemCodMaterial.AsInteger > 0 then
            begin
              RxDBLookupCombo7.KeyValue      := DM1.tOrdemCompraItemCodMaterial.AsInteger;
              RxDBLookupCombo5.KeyValue      := DM1.tOrdemCompraItemCodMaterial.AsInteger;
            end;
          //RxDBLookupCombo6Enter(Sender);
          if DM1.tOrdemCompraItemCodCor.AsInteger > 0 then
            RxDBLookupCombo6.KeyValue      := DM1.tOrdemCompraItemCodCor.AsInteger;
          CurrencyEdit6.Value              := DM1.tOrdemCompraItemCodMaterial.AsInteger;
          CurrencyEdit1.Value              := DM1.tOrdemCompraItemQtd.AsFloat;
          Edit3.Text                       := DM1.tOrdemCompraItemUnidade.AsString;
          CurrencyEdit2.Value              := DM1.tOrdemCompraItemVlrUnitario.AsFloat;
          CurrencyEdit4.Value              := DM1.tOrdemCompraItemAliqIPI.AsFloat;
          CUrrencyEdit5.Value              := DM1.tOrdemCompraItemVlrIPI.AsFloat;
          DateEdit1.Date                   := DM1.tOrdemCompraItemDtEntrega.AsDateTime;
          CurrencyEdit3.Value              := DM1.tOrdemCompraItemVlrTotal.AsFloat;
          Edit1.Text                       := DM1.tOrdemCompraItemObs.AsString;
          //DM1.tOrdemCompraVlrTotal.AsFloat := DM1.tOrdemCompraVlrTotal.AsFloat - DM1.tOrdemCompraItemVlrTotal.AsFloat;
          tAuxOrdemCompra.First;
          while not tAuxOrdemCompra.EOF do
            tAuxOrdemCompra.Delete;
          tAuxOrdemCompra.Refresh;
          if DM1.tOrdemCompraItemCodGrade.AsInteger > 0 then
            begin
              DM1.tGrade.IndexFieldNames := 'Codigo';
              DM1.tGrade.FindKey([DM1.tOrdemCompraItemCodGrade.AsInteger]);
            end;
          DM1.tOrdemCompraItemGrade.First;
          while not DM1.tOrdemCompraItemGrade.EOF do
            begin
              tAuxOrdemCompra.Insert;
              tAuxOrdemCompraCodGrade.AsInteger  := DM1.tOrdemCompraItemGradeCodGrade.AsInteger;
              tAuxOrdemCompraPosicao.AsInteger   := DM1.tOrdemCompraItemGradePosicao.AsInteger;
              tAuxOrdemCompraQtd.asFloat         := DM1.tOrdemCompraItemGradeQtd.AsFloat;
              tAuxOrdemCompraVlrUnitario.asFloat := DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat;
              tAuxOrdemCompraVlrTotal.asFloat    := DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat * DM1.tOrdemCompraItemGradeQtd.AsFloat;
              tAuxOrdemCompra.Post;
              DM1.tOrdemCompraItemGrade.Next;
            end;
          if DM1.tOrdemCompraItemGrade.RecordCount <> tAuxOrdemCompra.RecordCount then
            begin
              ShowMessage('Problema na hora de alterar o item');
              BitBtn8Click(Sender);
              DM1.tOrdemCompraItemGrade.Refresh;
            end
          else
            begin
              DM1.tOrdemCompraVlrTotal.AsFloat := DM1.tOrdemCompraVlrTotal.AsFloat - DM1.tOrdemCompraItemVlrTotal.AsFloat;
              DM1.tOrdemCompraItemGrade.First;
              while not DM1.tOrdemCompraItemGrade.EOF do
                DM1.tOrdemCompraItemGrade.Delete;
              DM1.tOrdemCompraItem.Delete;
              CurrencyEdit6.SetFocus;
            end;
        end
      else
        ShowMessage('H� um item pendente, voc� deve confirmar ou cancelar antes de alterar outro item!');
    end
  else
    ShowMessage('N�o h� registro p/ ser alterado, ou item ja entregue!');
end;

procedure TfOrdemCompra.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBGrid1DblClick(Sender: TObject);
begin
  if DM1.tOrdemCompra.State in [dsBrowse] then
    begin
      BitBtn16.Tag := 2;
      fBaixaItOC := TfBaixaItOC.Create(Self);
      fBaixaItOC.ShowModal;
      StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
    end;
end;

procedure TfOrdemCompra.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (DM1.tOrdemCompraItemQtdRestante.AsFloat > 0) then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end;
  if (DM1.tOrdemCompraItemQtdRestante.AsFloat > 0) and (DM1.tOrdemCompraItemQtdEntregue.AsFloat > 0) then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end;
  if DM1.tOrdemCompraItemQtdRestante.AsFloat = DM1.tOrdemCompraItemQtd.AsFloat then
    begin
      Background  := clWhite;
      AFont.Color := clBlack;
    end;
end;

procedure TfOrdemCompra.RxDBLookupCombo1Click(Sender: TObject);
begin
  Edit2.Text := RxDBLookupCombo1.Text;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tOrdemCompra.Refresh;
  DM1.tOrdemCompra.IndexFieldNames := 'Codigo';
  Edit2.Text := RxDBLookupCombo1.Text;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBLookupCombo1Exit(Sender: TObject);
begin
  Edit2.Text := RxDBLookupCombo1.Text;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBLookupCombo2CloseUp(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
  if DM1.tOrdemCompraCodFornecedor.AsInteger <> vCodFornecedor then
    DM1.tOrdemCompraCodCondPgto.AsString := DM1.tFornecedoresCodCondPgto.AsString;
end;

procedure TfOrdemCompra.RxDBLookupCombo2DropDown(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfOrdemCompra.RxDBLookupCombo2Enter(Sender: TObject);
begin
  vCodFornecedor := DM1.tOrdemCompraCodFornecedor.AsInteger;
end;

procedure TfOrdemCompra.RxDBLookupCombo3Exit(Sender: TObject);
begin
//Foi tirado as parcelas conferme solicitado pela Jurani
{  if RxDBLookupCombo3.Text <> '' then
     if DM1.tCondPgtoPrazoVista.AsString = 'P' then
       GroupBox2.Visible := True
     else
       GroupBox2.Visible := False;}
end;

procedure TfOrdemCompra.RxDBLookupCombo3DropDown(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Nome';
end;

procedure TfOrdemCompra.RxDBLookupCombo3CloseUp(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Codigo';
end;

procedure TfOrdemCompra.RxDBLookupCombo4CloseUp(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Codigo';
end;

procedure TfOrdemCompra.RxDBLookupCombo4DropDown(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfOrdemCompra.RxDBLookupCombo5Exit(Sender: TObject);
begin
  if RxDBLookupCombo5.Text <> '' then
    begin
      CurrencyEdit6.AsInteger   := RxDBLookupCombo5.KeyValue;
      RxDBLookupCombo7.KeyValue := RxDBLookupCombo5.KeyValue;
      Move_Itens;
      if DM1.tProdutoLancaGrade.AsBoolean then
        begin
          fOrdemCompraCor := tfOrdemCompraCor.Create(Self);
          fOrdemCompraCor.ShowModal;
          if not DM1.tProdutoLancaCor.AsBoolean then
            Edit3.SetFocus;
        end
      else
      if not DM1.tProdutoLancaCor.AsBoolean then
        CurrencyEdit1.SetFocus;
    end;
end;

procedure TfOrdemCompra.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Nome';
end;

procedure TfOrdemCompra.RxDBLookupCombo7Exit(Sender: TObject);
begin
  if RxDBLookupCombo7.Text <> '' then
    begin
      RxDBLookupCombo5.KeyValue := DM1.tProdutoCodigo.AsString;
      Move_itens;
    end;
end;

procedure TfOrdemCompra.RxDBLookupCombo7Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfOrdemCompra.RxDBLookupCombo6Enter(Sender: TObject);
begin
  if RxDBLookupCombo7.Text <> '' then
    begin
      DM1.tProduto.IndexFieldNames := 'Codigo';
      DM1.tProduto.SetKey;
      DM1.tProdutoCodigo.AsInteger := RxDBLookupCombo7.KeyValue;
      if DM1.tProduto.GotoKey then
        begin
          if DM1.tProdutoCor.RecordCount < 1 then
            begin
              CurrencyEdit1.SetFocus;
              RxDBLookupCombo6.ClearValue;
            end;
        end
      else
        RxDBLookupCombo7.SetFocus;
    end
  else
    RxDBLookupCombo7.SetFocus;
end;

procedure TfOrdemCompra.RxDBLookupCombo6Exit(Sender: TObject);
begin
  if RxDBLookupCombo6.Text <> '' then
    if (DM1.tProdutoLancaCor.AsBoolean) and (DM1.tProdutoPrecoCor.AsBoolean) then
      CurrencyEdit2.Value := DM1.tProdutoCorPrCusto.AsFloat;
end;

procedure TfOrdemCompra.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
    begin
      DM1.tProduto.Refresh;
      fProduto := TfProduto.Create(Self);
      fProduto.ShowModal;
      DM1.tProduto.Refresh;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir formul�rio de Material!');
end;

procedure TfOrdemCompra.CurrencyEdit6Exit(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Codigo';
  if CurrencyEdit6.AsInteger > 0 then
    begin
      DM1.tProduto.SetKey;
      DM1.tProdutoCodigo.AsInteger := CurrencyEdit6.AsInteger;
      if DM1.tProduto.GotoKey then
        begin
          RxDBLookupCombo7.KeyValue := DM1.tProdutoCodigo.AsInteger;
          RxDBLookupCombo5.KeyValue := DM1.tProdutoCodigo.AsInteger;
        end
      else
        begin
          ShowMessage('Produto/Material n�o cadastrado!');
          CurrencyEdit6.SetFocus;
          CurrencyEdit6.Clear;
        end;
    end;
end;

procedure TfOrdemCompra.CurrencyEdit6KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    begin
      if CurrencyEdit6.AsInteger > 0 then
        RxDBLookupCombo5.SetFocus
      else
        RxDBLookupCombo7.SetFocus;
    end;
end;

procedure TfOrdemCompra.FormCreate(Sender: TObject);
begin
  oDBUtils.OpenTables(True,Self);

  oDBUtils.ActiveDataSet(True,DM1.tOrdemCompraItemGrade,Name);
  oDBUtils.ActiveDataSet(True,DM1.tOrdemCompraNota,Name);
  oDBUtils.ActiveDataSet(True,DM1.tOrdemCompraNotaGrade,Name);

  DM1.tOrdemCompra.IndexFieldNames := 'Codigo';
  DM1.tOrdemCompra.Last;
  RxDBFilter1.Active := True;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

end.
