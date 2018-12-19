unit UGeraNotaEdi;

interface

uses                 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, Buttons, Db, DBTables, MemTable, ExtCtrls,
  RxLookup, Grids, DBGrids, RXDBCtrl, CurrEdit, rsDBUtils;

type
  TfGeraNotaEdi = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    tProdutoCli: TTable;
    DataSource1: TDataSource;
    tProdutoCliCodProduto: TIntegerField;
    tProdutoCliCodCor: TIntegerField;
    tProdutoCliCodCliente: TIntegerField;
    tProdutoCliCodProdCli: TStringField;
    RadioGroup1: TRadioGroup;
    Label6: TLabel;
    Label7: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    RxDBGrid1: TRxDBGrid;
    qEDI: TQuery;
    qEDINumMov: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_Cabecalho;
    procedure Grava_itens(Tamanho : String);
    procedure Grava_Vencimentos(Tipo : String);
    
  public
    { Public declarations }
  end;

var
  fGeraNotaEdi: TfGeraNotaEdi;
  F : TextFile;
  vCodNat2 : String;
  vBaseIPI : Real;
  vItem : Integer;
  vCodProdCli : String;
  vPedidoCli : String;

implementation

uses UDM1;

{$R *.DFM}

procedure TfGeraNotaEdi.Grava_Cabecalho;
var                           
  i : Integer;
  texto1, texto2, vAux : String;
  ano, mes, dia : Word;
begin
  //Identifica��o do Registro 1 at� 1  (1 caracter)
  texto1 := 'C';

  //N�mero da nota 2 at� 7  (6 caracteres)
  texto2 := DM1.tNotaFiscalNumNota.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //S�rie da Nota 8 at� 10  (3 caracteres)
  texto1 := texto1 + '   ';

  //Cgc da empresa emissora da nota 11 at� 24  (14 caracteres)
  texto2   := '';
  vAux     := DM1.tEmpresaCgc.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Cgc do cliente 25 at� 38  (14 caracteres)
  texto2   := '';
  vAux     := DM1.tNotaFiscallkCgcCli.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Cgc do substituto tribut�rio 39 at� 52  (14 caracteres)
  texto1 := texto1 + '              ';

  //Data da emiss�o da nota 53 at� 60  (8 caracteres)
  DecodeDate(DM1.tNotaFiscalDtEmissao.AsDateTime,Ano,Mes,Dia);
  texto1 := texto1 + IntToStr(Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);

  //"V" Venda  ou  "B" Beneficiamento 61 at� 61  (1 caracter)
  if vCodNat2 <> '' then
    texto1 := texto1 + 'B'
  else
    texto1 := texto1 + 'V';

  //C�digo da Natureza de Opera��o 62 at� 65  (4 caracteres)
  texto1 := texto1 + DM1.tNotaFiscallkCodNatOper.AsString;

  //Segundo c�digo da natureza de opera��o 66 at� 69  (4 caracteres)
  texto2 := vCodNat2;
  for i := 1 to 4 - length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Valor total do icms da nota 70 at� 81  (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrIcms.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Base de c�lculo do icms da nota 82 at� 93  (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalBaseIcms.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor isento do icms 94 at� 105  (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTotalNota.AsFloat -  DM1.tNotaFiscalBaseIcms.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor n�o tributado de ICMS  106 at� 117  (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Valor da transfer�ncia do icms 118 at� 129 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTransf.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor do ipi da nota fiscal 130 at� 141 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrIpi.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Base de c�lculo do ipi da nota fiscal 142 at� 153 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',vBaseIPI);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor isento do ipi 154 at� 165 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTotalNota.AsFloat -  vBaseIPI);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor n�o tributado do ipi 166 at� 177 (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Valor do frete 178 at� 189 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrFrete.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor do icms sobre o frete 190 at� 201 (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Cgc do transportador 202 at� 215 (12 caracteres)
  texto2   := '';
  vAux     := DM1.tNotaFiscallkCgcTransp.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Valor de outras despesas 216 at� 227 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalOutrasDesp.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor total do issqn 228 at� 239 (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Valor total dos produtos 240 at� 251 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTotalItens.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor total da nota fiscal 252 at� 263 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor que ser� faturado na nota fiscal 264 at� 275 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Campo de uso livre 276 at� 282 (7 caracteres)
  texto1 := texto1 + '       ';

  //Valor do seguro 283 at� 294 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrSeguro.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor Embalagem 295 at� 306 (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Valor desconto na nota 307 at� 318 (12 caracteres)
  texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //C�digo da transportadora 319 at� 323 (5 caracteres)
  texto1 := texto1 + '     ';

  writeln(F,texto1);
end;

procedure TfGeraNotaEdi.Grava_Itens(Tamanho : String);
var
  i : Integer;
  texto1, texto2, vAux : String;
  vValor : Real;
begin
  //Identifica��o do Registro 1 at� 1  (1 caracter)
  texto1 := 'I';

  //N�mero da Nota Fiscal 2 at� 7  (6 caracteres)
  texto1 := texto1 + FormatFloat('000000',DM1.tNotaFiscalNumNota.AsInteger);

  //S�rie da Nota Fiscal 8 at� 10  (3 caracteres)
  texto1 := texto1 + '   ';

  //Cgc da empresa emissora da nota 11 at� 24  (14 caracteres)
  texto2   := '';
  vAux     := DM1.tEmpresaCgc.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //N�mero do item da nota 25 at� 26  (2 caracteres)
  inc(vitem);
  texto1 := texto1 + FormatFloat('00',vItem);

  //C�digo do produto do cliente 27 at� 41  (15 caracteres)
  texto2 := vCodProdCli;
  if Tamanho <> '' then
    texto2 := texto2 + '-' + Tamanho;
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //N�mero da ordem de compra 42 at� 51  (10 caracteres)
  texto2 := copy(DM1.tNotaFiscalItensNumOC.AsString,1,10);
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Quantidade do produto 52 at� 61  (10 caracteres)
  if Tamanho = '' then
    texto2 := FormatFloat('000000.0000',DM1.tNotaFiscalItensQtd.AsFloat)
  else
    texto2 := FormatFloat('000000.0000',DM1.tNotaFiscalGradeQtd.AsFloat);
  Delete(Texto2,7,1);
  texto1 := texto1 + texto2;

  //Unidade de medida do produto 62 at� 64  (3 caracteres)
  texto2 := DM1.tNotaFiscalItensUnidade.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //F�brica ou esteira do cliente 65 at� 68  (4 caracteres)
  texto1 := texto1 + '    ';

  //Plano, remessa ou ficha do cliente 69 at� 74  (6 caracteres)
  texto2 := copy(DM1.tNotaFiscalItenslkNumOS.AsString,1,6);
  for i := 1 to 6 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Valor unit�rio do produto 75 at� 90  (16 caracteres)
  texto2 := FormatFloat('0000000000.000000',DM1.tNotaFiscalItensVlrUnit.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor do ipi do produto 91 at� 102  (12 caracteres)
  texto2 := '0000000000.00';
  if DM1.tNotaFiscalItensIpi.AsFloat > 0 then
    begin
      if Tamanho = '' then
        texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalItensVlrIpi.AsFloat)
      else
        begin
          vValor := (DM1.tNotaFiscalGradeQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat) * DM1.tNotaFiscalItensIpi.AsFloat / 100;
          texto2 := FormatFloat('0000000000.00',vValor);
        end
    end;
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Aliquota do icms do produtos 103 at� 107  (5 caracteres)
  texto2 := FormatFloat('00.000',DM1.tNotaFiscalItensIcms.AsFloat);
  Delete(Texto2,3,1);
  texto1 := texto1 + texto2;

  //C�digo da situa��o tribut�ria 108 at� 109  (2 caracteres)
  texto2 := copy(DM1.tNotaFiscalItenslkSitTributaria.AsString,2,2);
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Aliquota do ipi do produto 110 at� 114  (5 caracteres)
  texto2 := FormatFloat('00.000',DM1.tNotaFiscalItensIpi.AsFloat);
  Delete(Texto2,3,1);
  texto1 := texto1 + texto2;

  //Tipo de classifica��o do ipi 115 at� 115  (1 caracter)
  if DM1.tNotaFiscalItensIpi.AsFloat > 0 then
    texto1 := texto1 + 'T'
  else
    texto1 := texto1 + 'I';

  //Indica se a venda � drawback ou n�o 116 at� 116  (1 caracter)
  texto1 := texto1 + 'N';

  //N�mero da Nota de retorno de beneficiamento (nota origem) 117 at� 122  (6 caracteres)
  texto2 := DM1.tNotaFiscalItensNumNotaDevForn.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //S�rie da Nota de retorno de beneficiamento (nota origem) 123 at� 125  (3 caracteres)
  texto1 := texto1 + '   ';

  //N�mero do item da nota fiscal de retorno de beneficiamento 126 at� 140  (15 caracteres)
  texto2 := DM1.tNotaFiscalItensItemDev.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Valor do desconto do item da nota 141 at� 152  (12 caracteres)
  texto2 := '0000000000.00';
  if DM1.tNotaFiscalItensDesconto.AsFloat > 0 then
    begin
      if Tamanho = '' then
        texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalItensVlrDesconto.AsFloat)
      else
        begin
          vValor := DM1.tNotaFiscalGradeQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat;
          vValor := vValor * DM1.tNotaFiscalItensDesconto.AsFloat / 100;
          texto2 := FormatFloat('0000000000.00',vValor);
        end;
    end;
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //C�digo da natureza de opera��o 153 at� 156  (4 caracteres)
  texto2 := DM1.tNotaFiscalItenslkCodNatOper.AsString;
  for i := 1 to 4 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Tipo da opera��o V=Venda  M=M�o de Obra  R=Retorno  D=Desconto  157 at� 157  (1 caracter)
  if (DM1.tNotaFiscalItenslkCodNatOper.AsString = '5124') or (DM1.tNotaFiscalItenslkCodNatOper.AsString = '6124') then
    texto1 := texto1 + 'M'
  else
  if (DM1.tNotaFiscalItensMaterial.AsBoolean) and (DM1.tNotaFiscalItensNumNotaDevForn.AsInteger > 0) then
    texto1 := texto1 + 'R'
  else
    texto1 := texto1 + 'V';

  //Quantidade2  158 at� 166  (9 caracteres)
  texto1 := texto1 + '000000000';

  //Valor2  167 at� 178  (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Valor base de c�lculo da substitui��o tribut�ria 179 at� 190  (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Valor da substitui��o tribut�ria 191 at� 202  (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Campo de uso Livre 203 at� 288  (86 caracteres)
  for i := 1 to 86 do
    texto1 := texto1 + ' ';

  //C�digo do item no fornecedor 289 at� 308  (20 caracteres)
  texto2 := DM1.tNotaFiscalItenslkReferencia.AsString;
  for i := 1 to 20 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Pre�o l�quido do item 309 at� 320  (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Valor de despesas do item 321 at� 332  (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Cgc do emitente terceiro 333 at� 346  (14 caracteres)
  texto1 := texto1 + '              ';

  //N�mero da nota terceiro 347 at� 362  (16 caracteres)
  texto1 := texto1 + '                ';

  //S�rie da nota terceiro 363 at� 367  (5 caracteres)
  texto1 := texto1 + '     ';

  //Classifica��o fiscal do item 368 at� 377  (10 caracteres)
  texto1 := texto1 + '          ';

  //N�mero do lote do material 378 at� 387  (10 caracteres)
  texto1 := texto1 + '          ';

  //Data de validade do materal 388 at� 395  (8 caracteres)
  texto1 := texto1 + '        ';

  //Base de c�lculo do ipi 396 at� 407  (12 caracteres)
  texto2 := '0000000000.00';
  if DM1.tNotaFiscalItensIpi.AsFloat > 0 then
    begin
      if Tamanho = '' then
        vValor := DM1.tNotaFiscalItensVlrUnit.AsFloat * DM1.tNotaFiscalItensQtd.AsFloat
      else
        vValor := DM1.tNotaFiscalItensVlrUnit.AsFloat * DM1.tNotaFiscalGradeQtd.AsFloat;
      texto2 := FormatFloat('0000000000.00',vValor);
    end;
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;
  
  writeln(F,texto1);
end;

procedure TfGeraNotaEdi.Grava_Vencimentos(Tipo : String);
var                                                     
  i : Integer;
  texto1, texto2, vAux : String;
  ano, mes, dia : Word;
begin
  //Identifica��o do registro 1 at� 1  (1 caracter)
  texto1 := 'V';

  //N�mero da Nota Fiscal 2 at� 7  (6 caracteres)
  texto1 := texto1 + FormatFloat('000000',DM1.tNotaFiscalNumNota.AsInteger);

  //S�rie da Nota Fiscal 8 at� 10  (3 caracteres)
  texto1 := texto1 + '   ';

  //Cgc da empresa emissora da nota 11 at� 24  (14 caracteres)
  texto2   := '';
  vAux     := DM1.tEmpresaCgc.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //N�mero da parcela da nota 25 at� 26 (2 caracteres)
  texto1 := texto1 + FormatFloat('00',DM1.tNotaFiscalParcParcela.AsInteger);

  //N�mero da d�plicata 27 at� 36 (10 caracteres)
  texto2 := DM1.tNotaFiscalNumNota.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Valor da parcela 37 at� 48 (12 caracteres)
  if Tipo = 'P' then
    texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalParcVlrVenc.AsFloat)
  else
    texto2 := FormatFloat('0000000000.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Data do vencimento da parcela 49 at� 56 (8 caracteres)
  if Tipo = 'P' then
    begin
      DecodeDate(DM1.tNotaFiscalParcDtVenc.AsDateTime,ano,mes,dia);
      texto1 := texto1 + FormatFloat('0000',ano) + FormatFloat('00',mes) + FormatFloat('00',dia);
    end
  else
    texto1 := texto1 + '88888888';

  //Valor do desconto 57 at� 68 (12 caracteres)
  texto1 := texto1 + '000000000000';

  //Data de vencimento da d�plicata com desconto 69 at� 76 (8 caracteres)
  if Tipo = 'P' then
    texto1 := texto1 + '00000000'
  else
    texto1 := texto1 + '88888888';

  //Campo de uso livre 77 at� 152 (76 caracteres)
  for i := 1 to 76 do
    texto1 := texto1 + ' ';

  writeln(F,texto1);
end;

procedure TfGeraNotaEdi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tNotaFiscal.Filtered := False;
  oDBUtils.OpenTables(False,Self);
  Action := Cafree;
end;

procedure TfGeraNotaEdi.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfGeraNotaEdi.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfGeraNotaEdi.BitBtn1Click(Sender: TObject);
var
  i : Integer;
  ano, mes, dia : Word;
  vFlag : Boolean;
begin
  if ((DateEdit1.Text = '  /  /    ') and (DateEdit2.Text = '  /  /    ') and (RxDBLookupCombo1.Text = '')) or
     ((CurrencyEdit1.Value <= 0) and (CurrencyEdit2.Value <= 0) and (RxDBLookupCombo1.Text = '')) then
    ShowMessage('Falta informa��es!')
  else
    begin
      qEDI.Close;
      qEDI.Params[0].AsDate := Date;
      qEDI.Params[1].AsInteger := RxDBLookupCombo1.KeyValue;
      qEDI.Open;
      i := qEDINumMov.AsInteger + 1;
      DecodeDate(Date,ano,mes,dia);
      Edit1.Text := 'NF'+FormatFloat('00',Dia)+FormatFloat('00',Mes)+FormatFloat('00',i)+'.TXT';
      AssignFile(F,DirectoryEdit1.Text + '\' +Edit1.Text);
      Rewrite(F);
      DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumNota';
      DM1.tNotaFiscal.Filtered := False;
      case RadioGroup1.ItemIndex of
        0 : DM1.tNotaFiscal.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and CodCli = '''+IntToStr(RxDBLookupCombo1.KeyValue) +'''';
        1 : DM1.tNotaFiscal.Filter   := 'NumNota >= '''+IntToStr(CurrencyEdit1.AsInteger)+''' and NumNota <= '''+IntToStr(CurrencyEdit2.AsInteger)+''' and CodCli = '''+IntToStr(RxDBLookupCombo1.KeyValue) +'''';
      end;
      DM1.tNotaFiscal.Filtered := True;
      DM1.tNotaFiscal.First;
      while not DM1.tNotaFiscal.Eof do
        begin
          //Le os itens para somar a base do ipi e ver se tem mais de uma natureza de opera��o
          vCodNat2 := '';
          vBaseIPI := 0;
          DM1.tNotaFiscalItens.First;
          while not DM1.tNotaFiscalItens.Eof do
            begin
              if DM1.tNotaFiscalItensVlrIpi.AsFloat > 0 then
                vBaseIPI := vBaseIPI + DM1.tNotaFiscalItensVlrTotal.AsFloat;
              if DM1.tNotaFiscalItensNatOper.AsInteger <> DM1.tNotaFiscalCodNatOper.AsInteger then
                vCodNat2 := DM1.tNotaFiscalItenslkCodNatOper.AsString;
              DM1.tNotaFiscalItens.Next;
            end;

          Grava_Cabecalho;
          vItem    := 0;
          //Le os itens
          DM1.tNotaFiscalItens.First;
          while not DM1.tNotaFiscalItens.Eof do
            begin
              //Le o produto para ver o c�digo do produto do cliente
              vCodProdCli := '';
              if not DM1.tNotaFiscalItensMaterial.AsBoolean then
                begin
                  tProdutoCli.SetKey;
                  tProdutoCliCodProduto.AsInteger := DM1.tNotaFiscalItensCodProduto.AsInteger;
                  tProdutoCliCodCor.AsInteger     := DM1.tNotaFiscalItensCodCor.AsInteger;
                  tProdutoCliCodCliente.AsInteger := DM1.tNotaFiscalCodCli.AsInteger;
                  if tProdutoCli.GotoKey then
                    vCodProdCli := tProdutoCliCodCliente.AsString;
                end;
              //***********

              vFlag := False;
              DM1.tNotaFiscalGrade.First;
              while not DM1.tNotaFiscalGrade.Eof do
                begin
                  if DM1.tNotaFiscalGradeQtd.AsFloat > 0 then
                    begin
                      Grava_Itens(DM1.tNotaFiscalGradelkTamanho.AsString);
                      vFlag := True;
                    end;
                  DM1.tNotaFiscalGrade.Next;
                end;
              if not vFlag then
                Grava_Itens('');
              DM1.tNotaFiscalItens.Next;
            end;
          //Le os vencimentos
          if DM1.tNotaFiscalParc.RecordCount > 0 then
            begin
              DM1.tNotaFiscalParc.First;
              while not DM1.tNotaFiscalParc.Eof do
                begin
                  Grava_Vencimentos('P');
                  DM1.tNotaFiscalParc.Next;
                end;
            end
          else
          if DM1.tNotaFiscalCondPgto.AsString = 'V' then
            Grava_Vencimentos('V');
          Dm1.tArqEDI.Insert;
          Dm1.tArqEDIData.AsDateTime   := Date;
          Dm1.tArqEDICodCli.AsInteger  := Dm1.tNotaFiscalCodCli.AsInteger;
          Dm1.tArqEDINumMov.AsInteger  := i;
          Dm1.tArqEDINumNota.AsInteger := Dm1.tNotaFiscalNumNota.AsInteger;
          Dm1.tArqEDI.Post;
          DM1.tNotaFiscal.Next;
        end;
      ShowMessage('Arquivo gerado!');
      DM1.tNotaFiscal.Filtered := False;
      CloseFile(F);
    end;
end;

procedure TfGeraNotaEdi.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
          DateEdit1.Enabled := True;
          DateEdit2.Enabled := True;
          CurrencyEdit1.Enabled := False;
          CurrencyEdit2.Enabled := False;
        end;
    1 : begin
          DateEdit1.Enabled := False;
          DateEdit2.Enabled := False;
          CurrencyEdit1.Enabled := True;
          CurrencyEdit2.Enabled := True;
        end;
  end;
end;

procedure TfGeraNotaEdi.CurrencyEdit1Enter(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TfGeraNotaEdi.DateEdit1Enter(Sender: TObject);
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
end;

procedure TfGeraNotaEdi.FormCreate(Sender: TObject);
begin
  oDBUtils.OpenTables(True,Self);

  DirectoryEdit1.Text := DM1.tParametrosEnderecoNotaEDI.AsString;
  RadioGroup1Click(Sender);
end;

end.
