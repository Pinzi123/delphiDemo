unit CnDigits;
{--------------------------------------------------------------------
�f���Ʀr�ର������j�g���ե� Version 1.31
                          by lichaohui 2003.4.13

²��:
    �i�H��ƾ�ơA�B�I�ơA�ήɶ�������ƾ�
    �t�X�O�W�C��i�H�i��y���X���A�D�n�Ω�
    �F�i���~�d����PlayPrompt���ܻy�����X��
    �Ω�q��ô�Τ�������B�A����ήɶ�
    �٦���J���Ʀr�ǦC�A�P�ɧ�h�����Ω����
    �P��ô�Τ������L�o���ɪ�����j�g���B�r�q

email:
����Z��������������I�B�������O������O���

�ӦۡG�p��, �ɶ��G2003-4-14 13:44:00, ID�G1767011
to�GLiChaoHui

�S���ߺD�A���W�w�C
���A�ݬݤH���Ȧ檺�W�w�a�]�����w�A�ٱo���^_^�^�C

���T��g���کM������Ҫ��򥻳W�w

    �Ȧ�B���M�ӤH��g���U�ز��کM������ҬO��z��I����M�{�����I
�����n�̾ڡA������ô���I���⪺�ǽT�B�ήɩM�w���C���کM������ҬO��
��B���M�ӤH�̥H�O����Ȫ��|�p���ҡA�O�O���g�ٷ~�ȩM���T�g�ٳd����
�@�خѭ��ҩ��C�]���A��g���کM������ҡA��������зǤơB�W�d�ơA�n�n
�������B�Ʀr���T�B�r��M���B�����|�B�����A������C
    �@�B����j�g���B�Ʀr���Υ����Φ�Ѷ�g�A�p���]���^�B�L�]�L�^�B�ѡB
�v�]�v�^�B��]��^�B���]���^�B�m�B�áB�h�B�B�B�աB�a�B�U�]�U�^�B���B
���B���B���B�s�B��]���^���r�ˡC���o�Τ@�B�G�]��^�B�T�B�|�B���B���B
�C�B�K�B�E�B�Q�B���B��B�t�]��0�^��g�A���o�۳y²�Ʀr�C�p�G���B�Ʀr
�Ѽg���ϥ��c��r�A�p�a�B  �B�|�B���B�A���A�]�����z�C
    �G�B����j�g���B�Ʀr�졧��������A�b����������A���g���㡨
�]�Ρ������^�r�A�b����������i�H���g���㡨�]�Ρ������^�r�C�j�g���B��
�r�����������A�������᭱���g���㡨�]�Ρ������^�r�C
    �T�B����j�g���B�Ʀr�e���Щ����H�������r�ˡA�j�g���B�Ʀr����
���H�������r�˶�g�A���o�d���ťաC�j�g���B�Ʀr�e���L���H�������r�˪��A
���[�񡧤H�������T�r�C�b���کM������Ҥj�g���B�椺���o�w�L�T�w�����a�B
�աB�B�B�U�B�a�B�B�B�B�B���B���B�����r�ˡC
    �|�B���ԧB�p�g���B�Ʀr������0���ɡA����j�g�����Ӻ~�y�y���W�ߡB
���B�Ʀr�c���M�����諸�n�D�i��Ѽg�C�|�Ҧp�U�G
    �]�@�^���ԧB�Ʀr��������O���ɡA����j�g���B�n�g���s���r�C�p
          �D1�A409�O50�A���g���H�������a�v�չs�h����C
    �]�G�^���ԧB�Ʀr�����s�򦳴X�ӡ�0���ɡA����j�g���B�����i�H���g
          �@�ӡ��s���r�C�p�D6�A007�O14�A���g���H�������a�s�m�������v���C
    �]�T�^���ԧB���B�Ʀr�U��Τ���O��0���A�Ϊ̼Ʀr�����s�򦳴X�ӡ�0���A
          �U��B����]�O��0���A���d��B���줣�O��0���ɡA����j�g���B��
          �i�H���g�@�ӹs�r�A�]�i�H���g���s���r�C�p�D1�A680�O32�A���g��
          �H�������a���ծìB���s�Ѩ��L���A�Ϊ̼g���H�������a���ծìB��
          �Ѩ��L���F�S�p�D107�A000�O53�A���g���H�������B�U�m�a���s�
          �Ѥ��A�Ϊ̼g���H�������B�U�s�m�a����Ѥ��C
    �]�|�^���ԧB���B�Ʀr����O��0���A�Ӥ��줣�O��0���ɡA����j�g���B
          �������᭱���g���s���r�C�p�D16�A409.02�A���g���H�������U��
          �a�v�չs�h���s�L���F�S�p�D325�O04�A���g���H�����ѨնL�B�
          �s�v���C
    ���B���ԧB�p�g���B�Ʀr�e���A������g�J�����Ÿ����D���]�ί�g�G�^�C
���ԧB�p�g���B�Ʀr�n�{�u��g�A���o�s�g���뤣�M�C
    ���B���ڪ��X����������ϥΤ���j�g�C�������ܳy���ڪ��X�[����A�b
��g��B��ɡA�묰���B�L�M���B���A�鬰���ܨh�M���B�B�L�B�M�ѩ諸�A��
�b��e�[���s���F�鬰����ܬB�h���A���b��e�[�������C�p1��15��A���g��
�s������B���C�A�p10��20��A���g���s���B��s�L�B��C
    �C�B���ڥX������ϥΤp�g��g���A�Ȧ椣�����z�C�j�g��������n�D�W�d
��g���A�Ȧ�i�����z�A���Ѧ��y���l�����A�ѥX���J�ۦ�Ӿ�C
--------------------------------------------------------------------}
{ $message 'NOTICE: uncomment following line to discard unused code !'}
{ $message '�`�N: �h���U���o�@��A�i�H�߱󦬶����䥦�N�X'}
// {$define discard_other_code}

interface

uses
  Windows, Messages, SysUtils, Classes, Math;

type
  //�����w�q
  TDate = TDateTime;
  TTime = TDateTime;

  { ����Ʀr�j�g�ե� by lichaohui }

  TCnDigits = class(TComponent)
  private
    Fda: Boolean;
    procedure SetDA(const Value: Boolean);
    procedure SetCnUP(const Value: String);
  protected
    FCurrVa: Currency;
    FCnUpDigits: String;
    FAlias: TStrings;
    procedure SetCurrVa(const Value: Currency);
    procedure SetAlias(const Value: TStrings);
  public
    {$ifndef discard_other_code}
    //�U���O�v�����ӳ��޲z���X�����N�X
    //��[�H����������ƭ�
    class function other_RMB(NN:real):string;
    //�䥦����Ӥ�k
    class function other_SmallTOBig(small: real): string;
    class function other_XD(xx: currency): string;
    {$endif}
    //�U���Olichaohui���u����
    class function LzhFmtInt(IntValue: Int64;
      IsYear: Boolean = False; SoftTone: Boolean = False): String;
    class function LzhFmtDigits(Digits: String): String;
    class function LzhFmtFloat(FloatValue: Extended;
      RoundPos: Integer = 8): String;
    class function LzhFmtCurrency(AValue: Currency): String; overload;
    class function LzhFmtCurrency(AValue: Int64): String; overload;
    class function LzhFmtDate(AValue: TDate;
      DigitsYear: Boolean = False): String;
    class function StdFmtDate(AValue: TDate;
      DigitsYear: Boolean = False): String;
    class function LzhFmtTime(AValue: TTime;
      HasSecond: Boolean = False): String;
    class function LzhFmtDateTime(AValue: TDateTime;
      DigitsYear: Boolean = False): String;
    class function StdFmtDateTime(AValue: TDateTime;
      DigitsYear: Boolean = False): String;
    //�`�Τ�k�եα��f
    function ChineseUpper(Curr: Currency): String;
    function ChineseDate(ADate: TDate;
      DigitsYear: Boolean = False): String;
    function ChineseTime(ATime: TTime;
      HasSecond: Boolean = False): String;
    //�����O�W���
    function StrToAlias(S: String): String;
    function StrToAlias2(S: String): String;
    //�c�y�M�R�c���
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CurrencyValue: Currency read FCurrVa write SetCurrVa;
    property CnUpperDigits: String read FCnUpDigits write SetCnUP stored False;
    property Alias: TStrings read FAlias write SetAlias;
    property DefaultAlias: Boolean read Fda write SetDA;
  end;

const
  DP: WideString = '�s���L�Ѹv��m�èh��t';
  DN: WideString = '�I�B�եa�U�B�եa���B�եa�U�B�եa���B�եa';
  CrNa: WideString = '��������';
  DtNa: WideString = '�~���ɤ���';

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('System', [TCnDigits]);
end;

{ TCnDigits }

{$ifndef discard_other_code}
class function TCnDigits.other_RMB(NN: real): string;
var
  HZ, NS, NW, NA, N1, N2:string;
  LA, X, Nk:integer;
begin
  //����N�X�O���F�ץ��p�Ʀ�h����ɥͦ������G�����~
  NN := Int(NN * 100) / 100;
  //�U�����N�X�Qlichaohui�榡�ƾ�z
  if NN > 9999999999999.99 then
  begin
    //MessageDlg('���B���X�C',mtError,[mbOk], 0);
    HZ := '';
    Result := HZ;
    exit;
  end;
  if NN = 0 then
  begin
    HZ := '�s��';
    result := HZ;
    exit;
  end;
  NS := '�s���L�Ѹv��m�èh';
  NW := '�������B�եa�U�B�եa���B�եa�U';
  NA := FloatToStr(NN * 100);
  LA := length(NA);
  X := 1;
  HZ := '';
  while X<=LA do
  begin
    NK := Ord(NA[x]) - Ord('0');
    N1 := Copy(NS, NK * 2 + 1, 2);
    N2 := Copy(NW, LA * 2 + 1 - X * 2, 2);
    if (NK = 0) AND ((N2 = '��') OR( N2 = '�U') OR( N2 = '��'))then
    begin
      if copy(HZ,Length(HZ)-1,2) = '�s' then
        HZ := copy(HZ, 1, length(HZ) - 2);
      if copy(HZ, Length(HZ) - 1, 2) = '��' then
        if N2 = '��' then
        begin
          N1 := N2;
          N2 := '�s';
        end
        else
          N2 := ''
      else
      begin
        N1 := N2;
        N2 := '�s';
      end
    end
    else if NK=0 then
    begin
      if copy(HZ, length(HZ) - 1, 2)='�s' then
        N1 := '';
      if N2='��' then
      begin
        if copy(HZ, length(HZ) - 1, 2)='�s' then
          HZ := copy(HZ, 1, length(HZ) - 2) + '��'
        else
          HZ := HZ + '��';
         N1 := '';
      end;
      N2 := '';
    end;
    HZ := HZ + N1 + N2;
    X := X + 1
  end; {end of while statement}
  Result := HZ;
end;

class function TCnDigits.other_SmallTOBig(small: real): string;
var
  SmallMonth,BigMonth:string;
  wei1,qianwei1:string[2];
  qianwei,dianweizhi,qian:integer;
begin
  {------- �ק�ѼƥO�ȧ��T -------}
  {�p���I�᪺��ơA�ݭn���ܤ]�i�H��ʸӭ�}
  qianwei:=-2;

  {�ഫ���f���Φ��A�ݭn���ܤp���I��[�h�X�ӹs}
  Smallmonth:=formatfloat('0.00',small);
  {---------------------------------}

  dianweizhi :=pos('.',Smallmonth);{�p���I����m}

  {�`���p�g�f�����C�@��A�q�p�g���k���m�쥪��}
  for qian:=length(Smallmonth) downto 1 do
    begin
      {�p�GŪ�쪺���O�p���I�N�~��}
      if qian<>dianweizhi then
        begin
          {��m�W�����ഫ���j�g}
          case strtoint(copy(Smallmonth,qian,1)) of
            1:wei1:='��'; 2:wei1:='�L';
            3:wei1:='��'; 4:wei1:='�v';
            5:wei1:='��'; 6:wei1:='��';
            7:wei1:='�m'; 8:wei1:='��';
            9:wei1:='�h'; 0:wei1:='�s';
          end;
          {�P�_�j�g��m�A�i�H�~��W�j��real�������̤j�ȡA�i�O�֦�����h��}
          case qianwei of
            -3:qianwei1:='��';
            -2:qianwei1:='��';
            -1:qianwei1:='��';
            0 :qianwei1:='��';
            1 :qianwei1:='�B';
            2 :qianwei1:='��';
            3 :qianwei1:='�d';
            4 :qianwei1:='�U';
            5 :qianwei1:='�B';
            6 :qianwei1:='��';
            7 :qianwei1:='�d';
            8 :qianwei1:='��';
            9 :qianwei1:='�B';
            10:qianwei1:='��';
            11:qianwei1:='�d';
          end;
      inc(qianwei);
      BigMonth :=wei1+qianwei1+BigMonth;{�զX���j�g���B}
    end;
  end;
  Result := BigMonth;
end;

class function TCnDigits.other_XD(xx: currency): string;
var
  dx,ws:string;
  i,cd:integer;
  int:currency;
begin
  int:=trunc(abs(xx)+0.005*100);
  cd:=length(currtostr(int));
  dx:='�s���L�Ѹv��m�èh';
  ws:='�������B�եa�U�B�եa���B�եa';
  result:='';
  i:=1;
  while i <= cd do
  begin
    result := result + copy(dx,strtoint(copy(currtostr(int),i,1))*2+1,2);
    result := result + copy(ws,(cd-i)*2+1,2);
    i:=i+1;
  end;
end;
{$endif}

class function TCnDigits.LzhFmtCurrency(AValue: Currency): String;
var
  IntPart: Int64;
  FracPart: Integer;
  Jiao, Fen: Integer;
  rs: WideString;
  ts: String;
  dts: Integer;
begin
  //��o��Ƴ���
  IntPart := Trunc(Abs(AValue));
  //��o���p�Ƴ���
  //���B�X�{�٤J���`�A�Y�٤J�����G�L�k�w�ơA�h��
  //DFW�W��sichuan�o�{�����~�A�b���i��ץ�
  //FracPart := Round(Frac(Abs(AValue)) * 100);
  //�ץ��᪺�y�y
  //FracPart := Trunc(Abs(AValue) * 100 + 1e-5) mod 100;
  //�榡�ƾ�Ƴ���
  ts := FormatFloat('0.00', AValue);
  dts := Pos('.', ts);
  rs := LzhFmtInt(IntPart) + CrNa[1];
  //Jiao := FracPart div 10 mod 10;
  Jiao := Ord(ts[dts + 1]) - Ord('0');
  //Fen := FracPart mod 10;
  Fen := Ord(ts[dts + 2]) - Ord('0');
  FracPart := Jiao * 10 + Fen;
  //�p�G�Ӧ쬰�s�B�j��s�A�h�ɹs
  if (IntPart mod 10 = 0) and (IntPart > 0) and (FracPart >= 10) then
    rs := rs + DP[1];
  if (IntPart = 0) and (FracPart <> 0)  then rs := '';
  if FracPart >= 10 then
  begin
    if FracPart mod 10 = 0 then
      rs := rs + DP[Jiao + 1] + CrNa[2] + CrNa[4]
    else
      rs := rs + DP[Jiao + 1] + CrNa[2] + DP[Fen + 1] + CrNa[3];
  end
  else if FracPart > 0 then
  begin
    if IntPart = 0 then
      rs := rs + DP[Fen + 1] + CrNa[3]
    else
      rs := rs + DP[1] + DP[Fen + 1] + CrNa[3];
  end
  else
  begin
    rs := rs + CrNa[4];
  end;
  if AValue < 0 then rs := DP[12] + rs;
  Result := rs;
end;

class function TCnDigits.LzhFmtCurrency(AValue: Int64): String;
var
  IntPart: Int64;
  FracPart: Integer;
  Jiao, Fen: Integer;
  rs: WideString;
begin
  //��o��Ƴ���
  IntPart := Abs(AValue) div 100;
  //��o���p�Ƴ���
  FracPart := Abs(AValue) mod 100;
  //�榡�ƾ�Ƴ���
  rs := LzhFmtInt(IntPart) + CrNa[1];
  Jiao := FracPart div 10 mod 10;
  Fen := FracPart mod 10;
  //�p�G�Ӧ쬰�s�B�j��s�A�h�ɹs
  if (IntPart mod 10 = 0) and (IntPart > 0) and (FracPart >= 10) then
    rs := rs + DP[1];
  if (IntPart = 0) and (FracPart <> 0)  then rs := '';
  if FracPart >= 10 then
  begin
    if FracPart mod 10 = 0 then
      rs := rs + DP[Jiao + 1] + CrNa[2] + CrNa[4]
    else
      rs := rs + DP[Jiao + 1] + CrNa[2] + DP[Fen + 1] + CrNa[3];
  end
  else if FracPart > 0 then
  begin
    if IntPart = 0 then
      rs := rs + DP[Fen + 1] + CrNa[3]
    else
      rs := rs + DP[1] + DP[Fen + 1] + CrNa[3];
  end
  else
  begin
    rs := rs + CrNa[4];
  end;
  if AValue < 0 then rs := DP[12] + rs;
  Result := rs;
end;

class function TCnDigits.LzhFmtDate(AValue: TDate;
  DigitsYear: Boolean): String;
var
  yy, mm, dd: Word;
  ys: WideString;
  rs: WideString;
begin
  DecodeDate(AValue, yy, mm, dd);
  if DigitsYear then
    ys := LzhFmtDigits(IntToStr(yy)) + DtNa[1]
  else
    ys := LzhFmtInt(yy, True) + DtNa[1];
  rs := ys + LzhFmtInt(mm) + DtNa[2] + LzhFmtInt(dd) + DtNa[3];
  Result := rs;
end;

class function TCnDigits.LzhFmtDateTime(AValue: TDateTime;
  DigitsYear: Boolean): String;
var
  dt: TDate;
  tm: TTime;
begin
  dt := AValue;
  tm := AValue;
  Result := LzhFmtDate(dt, DigitsYear) + LzhFmtTime(tm);
end;

class function TCnDigits.LzhFmtDigits(Digits: String): String;
var
  i, len: Integer;
  rs: WideString;
begin
  len := Length(Digits);
  for i := 1 to len do
  begin
    if (Digits[i] >= '0') and (Digits[i] <= '9') then
    begin
      rs := rs + DP[(Ord(Digits[i]) - (Ord('0'))) mod 10 + 1];
    end
    else if Digits[i] = '.' then
    begin
      rs := rs + DN[1];
    end
    else
    begin
      rs := '';
      Break;
    end;
  end;
  Result := rs;
end;

class function TCnDigits.LzhFmtFloat(FloatValue: Extended;
  RoundPos: Integer): String;
var
  IntPart: Int64;
  FraPart: Int64;
  Digits: String;
  len, rps: Integer;
  beit: Extended;
  rs: WideString;
begin
  if (FloatValue > 1e15) or (FloatValue < -1e15) then
  begin
    //�W�X�ƪ��w�w�q�d��A�h������^�ŭ�
    Result := '';
    Exit;
  end;
  IntPart := Trunc(Abs(FloatValue));
  rps := Abs(RoundPos);
  if rps > 16 then rps := 16;
  beit := IntPower(10, rps);
  FraPart := Round(Frac(FloatValue) * beit);
  rs := LzhFmtInt(IntPart);
  if FraPart > 0 then
  begin
    Digits := IntToStr(FraPart);
    len := Length(Digits);
    while (len > 0) and (Digits[len] = '0') do len := len - 1;
    Digits := Copy(Digits, 1, len);
    rs := rs + DN[1] + LzhFmtDigits(Digits);
  end;
  if FloatValue < 0 then rs := DP[12] + rs;
  Result := rs;
end;

class function TCnDigits.LzhFmtInt(IntValue: Int64;
  IsYear: Boolean; SoftTone: Boolean): String;
var
  i, n, t: Integer;
  bi: WideString;
  LastBt: WideChar;
  rs: WideString;
  reach: Boolean;
  LastHit: Integer;
begin
  //���18���
  if IntValue < 0 then rs := DP[12];
  IntValue := Abs(IntValue);
  //��J���ƭ����p��800���A�]�N�O8e18;
  if IntValue > 8000000000000000000 then
  begin
    Result := '';
    Exit;
  end;
  bi := IntToStr(IntValue);
  //�榡�Ƭ�
  bi := StringOfChar('0', 20 - Length(bi)) + bi;
  //�q�����}�l�榡��
  LastBt := ' ';
  LastHit := 0;
  reach := False;
  for i := 1 to 20 do
  begin
    //�p�G�D0
    if (bi[i] >= '1') and (bi[i] <= '9') then
    begin
      //�p�G�e�@��O0,�S������ɦ�A�ɹs
      if reach and (LastBt = '0') and (i mod 4 <> 1) then
      begin
        rs := rs + DP[1];
      end;
      reach := True;
      //�ഫ�Ʀr,�p�G�O�Q��A�B�e�@�쬰0
      if SoftTone and (i mod 4 = 3) and (LastBt = '0')
        and ((not reach) or (bi[i] = '1')) then
      else
      begin
        rs := rs + DP[(Ord(bi[i]) - Ord('0')) mod 10 + 1];
      end;
      //�K�[��W
      n := (20 - i) mod 20 + 1;
      if n > 1 then
      begin
        rs := rs + DN[n];
      end;
      LastHit := 20 - i;
    end;
    //���ɦW
    if (bi[i] = '0') and (i mod 4 = 0) and reach then
    begin
      //�S����ɳB����ܭ�h�A8��e���Ū�����ܤ��ɦW
      //���O8��B���A4��e���Ť���ܤ��ɦW
      n := (20 - i) mod 20 + 1;
      t := n - 1;
      if (n > 1) and ( ((t mod 8 = 0) and (LastHit - t < 8))
        or (((t - 12) mod 8 = 0) and (LastHit - t < 4))) then
      begin
        rs := rs + DN[n];
      end;
    end;
    LastBt := bi[i];
  end;
  if rs = '' then rs := DP[1];
  if IsYear and (IntValue div 1000 = 2) then
    rs[1] := DP[11];
  Result := rs;
end;

class function TCnDigits.LzhFmtTime(AValue: TTime;
  HasSecond: Boolean): String;
var
  hh, mm, ss, ms: Word;
  rs: WideString;
begin
  DecodeTime(AValue, hh, mm, ss, ms);
  rs := LzhFmtInt(hh, False, True) + DtNa[4] +
    LzhFmtInt(mm, False, True) + DtNa[5];
  if HasSecond then
    rs := rs + LzhFmtInt(ss, False, True) + DtNa[6];
  Result := rs;
end;

procedure TCnDigits.SetCurrVa(const Value: Currency);
begin
  FCurrVa := Value;
  FCnUpDigits := LzhFmtCurrency(Value);
end;

function TCnDigits.ChineseUpper(Curr: Currency): String;
begin
  Result := LzhFmtCurrency(Curr);
end;

function TCnDigits.ChineseDate(ADate: TDate; DigitsYear: Boolean): String;
begin
  Result := LzhFmtDate(ADate, DigitsYear);
end;

function TCnDigits.ChineseTime(ATime: TTime; HasSecond: Boolean): String;
begin
  Result := LzhFmtTime(ATime, HasSecond);
end;

procedure TCnDigits.SetAlias(const Value: TStrings);
begin
  FAlias.Assign(Value);
  TStringList(FAlias).Sorted := True;
  TStringList(FAlias).Duplicates := dupIgnore;
end;

function TCnDigits.StrToAlias(S: String): String;
var
  Ws: WideString;
  i: Integer;
  t: Integer;
begin
  Ws := S;
  for i := 1 to Length(Ws) do
  begin
    t := TStringList(FAlias).IndexOfName(Ws[i]);
    if t >= 0 then
      if Result = '' then
        Result := FAlias.Values[Ws[i]]
      else
        Result := Result + ',' + FAlias.Values[Ws[i]]
    else
      if Result = '' then
        Result := Ws[i]
      else
        Result := Result + Ws[i];
  end;
end;

function TCnDigits.StrToAlias2(S: String): String;
var
  Ws: WideString;
  i: Integer;
  t: Integer;
begin
  Ws := S;
  for i := 1 to Length(Ws) do
  begin
    t := TStringList(FAlias).IndexOfName(Ws[i]);
    if t >= 0 then
      Result := Result + FAlias.Values[Ws[i]]
    else
      Result := Result + Ws[i];
  end;
end;

constructor TCnDigits.Create(AOwner: TComponent);
begin
  inherited;
  FAlias := TStringList.Create;
  TStringList(FAlias).Sorted := True;
  TStringList(FAlias).Duplicates := dupIgnore;
end;

destructor TCnDigits.Destroy;
begin
  FAlias.Free;
  inherited;
end;

procedure TCnDigits.SetDA(const Value: Boolean);
var
  Ws: WideString;
  i: Integer;
  sv: String;
begin
  if Value then
  begin
    Ws := DP + DN + CrNa + DtNa;
    for i := 1 to Length(Ws) do
    begin
      sv := Ws[i];
      FAlias.Add(sv + '=' + FAlias.Values[Ws[i]]);
    end;
  end
  else
  begin
    for i := FAlias.Count - 1 downto 0 do
    begin
      sv := FAlias[i];
      if Trim(sv) = '' then
        FAlias.Delete(i)
      else
      if (Length(sv) > 0) and (sv[Length(sv)] = '=') then
        FAlias.Delete(i);
    end;
  end;
  Fda := Value;
end;

procedure TCnDigits.SetCnUP(const Value: String);
begin
  //FCnUpDigits := Value;
end;

class function TCnDigits.StdFmtDate(AValue: TDate;
  DigitsYear: Boolean): String;
var
  yy, mm, dd: Word;
  ys: WideString;
  rs: WideString;
begin
  DecodeDate(AValue, yy, mm, dd);
  if DigitsYear then
    ys := LzhFmtDigits(IntToStr(yy)) + DtNa[1]
  else
    ys := LzhFmtInt(yy, True) + DtNa[1];
  rs := ys;
  if (mm <= 2) or (mm = 10) then
    rs := rs + DP[1];
  rs := rs + LzhFmtInt(mm) + DtNa[2];
  if (dd < 10) or (dd mod 10 = 0) then
    rs := rs + DP[1];
  rs := rs + LzhFmtInt(dd) + DtNa[3];
  Result := rs;
end;

class function TCnDigits.StdFmtDateTime(AValue: TDateTime;
  DigitsYear: Boolean): String;
var
  dt: TDate;
  tm: TTime;
begin
  dt := AValue;
  tm := AValue;
  Result := StdFmtDate(dt, DigitsYear) + LzhFmtTime(tm);
end;

end.
