unit CnDigits;
{--------------------------------------------------------------------
貨幣數字轉為為中文大寫的組件 Version 1.31
                          by lichaohui 2003.4.13

簡介:
    可以轉化整數，浮點數，及時間日期型數據
    配合別名列表可以進行語音合成，主要用於
    東進中繼卡中的PlayPrompt提示語音的合成
    用於電話繫統中播放金額，日期及時間
    還有輸入的數字序列，同時更多的應用於顯示
    銷售繫統中的打印發票時的中文大寫金額字段

email:
ｌｉ╴ｖｉｏｌｅｔｃｎ＠ｙａｈｏｏ﹒ｃｏｍ﹒ｃｎ

來自：小豬, 時間：2003-4-14 13:44:00, ID：1767011
to：LiChaoHui

沒有習慣，有規定。
給你看看人民銀行的規定吧（說不定你還得改改^_^）。

正確填寫票據和結算憑證的基本規定

    銀行、單位和個人填寫的各種票據和結算憑證是辦理支付結算和現金收付
的重要依據，直接關繫到支付結算的準確、及時和安全。票據和結算憑證是銀
行、單位和個人憑以記載賬務的會計憑證，是記載經濟業務和明確經濟責任的
一種書面證明。因此，填寫票據和結算憑證，必須做到標準化、規範化，要要
素齊全、數字正確、字跡清晰、不錯漏、不潦草，防止塗改。
    一、中文大寫金額數字應用正楷或行書填寫，如壹（壹）、貳（貳）、參、
肆（肆）、伍（伍）、陸（陸）、柒、捌、玖、拾、佰、仟、萬（萬）、億、
元、角、分、零、整（正）等字樣。不得用一、二（兩）、三、四、五、六、
七、八、九、十、念、毛、另（或0）填寫，不得自造簡化字。如果金額數字
書寫中使用繁體字，如兀、  、�|、悄、�A的，也應受理。
    二、中文大寫金額數字到“元”為止的，在“元”之後，應寫“整”
（或“正”）字，在“角”之後可以不寫“整”（或“正”）字。大寫金額數
字有“分”的，“分”後面不寫“整”（或“正”）字。
    三、中文大寫金額數字前應標明“人民幣”字樣，大寫金額數字應緊接
“人民幣”字樣填寫，不得留有空白。大寫金額數字前未印“人民幣”字樣的，
應加填“人民幣”三字。在票據和結算憑證大寫金額欄內不得預印固定的“仟、
佰、拾、萬、仟、伯、拾、元、角、分”字樣。
    四、阿拉伯小寫金額數字中有“0”時，中文大寫應按照漢語語言規律、
金額數字構成和防止塗改的要求進行書寫。舉例如下：
    （一）阿拉伯數字中間有“O”時，中文大寫金額要寫“零”字。如
          ¥1，409﹒50，應寫成人民幣壹仟肆佰零玖元伍角。
    （二）阿拉伯數字中間連續有幾個“0”時，中文大寫金額中間可以隻寫
          一個“零”字。如¥6，007﹒14，應寫成人民幣陸仟零柒元壹角肆分。
    （三）阿拉伯金額數字萬位或元位是“0”，或者數字中間連續有幾個“0”，
          萬位、元位也是“0’，但千位、角位不是“0”時，中文大寫金額中
          可以隻寫一個零字，也可以不寫“零”字。如¥1，680﹒32，應寫成
          人民幣壹仟陸佰捌拾元零參角貳分，或者寫成人民幣壹仟陸佰捌拾元
          參角貳分；又如¥107，000﹒53，應寫成人民幣壹拾萬柒仟元零伍角
          參分，或者寫成人民幣壹拾萬零柒仟元伍角參分。
    （四）阿拉伯金額數字角位是“0”，而分位不是“0”時，中文大寫金額
          “元”後面應寫“零”字。如¥16，409.02，應寫成人民幣壹萬陸
          仟肆佰零玖元零貳分；又如¥325﹒04，應寫成人民幣參佰貳拾伍元
          零肆分。
    五、阿拉伯小寫金額數字前面，均應填寫入民幣符號“¥”（或草寫：）。
阿拉伯小寫金額數字要認真填寫，不得連寫分辨不清。
    六、票據的出票日期必須使用中文大寫。為防止變造票據的出稟日期，在
填寫月、日時，月為壹、貳和壹拾的，日為壹至玖和壹拾、貳拾和參抬的，應
在其前加“零”；日為抬壹至拾玖的，應在其前加“壹”。如1月15日，應寫成
零壹月壹拾伍日。再如10月20日，應寫成零壹拾月零貳拾日。
    七、票據出票日期使用小寫填寫的，銀行不予受理。大寫日期未按要求規範
填寫的，銀行可予受理，但由此造成損失的，由出票入自行承擔。
--------------------------------------------------------------------}
{ $message 'NOTICE: uncomment following line to discard unused code !'}
{ $message '注意: 去掉下面這一行，可以拋棄收集的其它代碼'}
// {$define discard_other_code}

interface

uses
  Windows, Messages, SysUtils, Classes, Math;

type
  //類型定義
  TDate = TDateTime;
  TTime = TDateTime;

  { 中文數字大寫組件 by lichaohui }

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
    //下面是肖楊的商場管理源碼中的代碼
    //返加人民幣的中文數值
    class function other_RMB(NN:real):string;
    //其它的兩個方法
    class function other_SmallTOBig(small: real): string;
    class function other_XD(xx: currency): string;
    {$endif}
    //下面是lichaohui的工具函數
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
    //常用方法調用接口
    function ChineseUpper(Curr: Currency): String;
    function ChineseDate(ADate: TDate;
      DigitsYear: Boolean = False): String;
    function ChineseTime(ATime: TTime;
      HasSecond: Boolean = False): String;
    //等價別名轉化
    function StrToAlias(S: String): String;
    function StrToAlias2(S: String): String;
    //構造和析構函數
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CurrencyValue: Currency read FCurrVa write SetCurrVa;
    property CnUpperDigits: String read FCnUpDigits write SetCnUP stored False;
    property Alias: TStrings read FAlias write SetAlias;
    property DefaultAlias: Boolean read Fda write SetDA;
  end;

const
  DP: WideString = '零壹貳參肆伍陸柒捌玖兩負';
  DN: WideString = '點拾佰仟萬拾佰仟億拾佰仟萬拾佰仟兆拾佰仟';
  CrNa: WideString = '元角分整';
  DtNa: WideString = '年月日時分秒';

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
  //此行代碼是為了修正小數位多於兩位時生成的結果的錯誤
  NN := Int(NN * 100) / 100;
  //下面的代碼被lichaohui格式化整理
  if NN > 9999999999999.99 then
  begin
    //MessageDlg('金額溢出。',mtError,[mbOk], 0);
    HZ := '';
    Result := HZ;
    exit;
  end;
  if NN = 0 then
  begin
    HZ := '零元';
    result := HZ;
    exit;
  end;
  NS := '零壹貳參肆伍陸柒捌玖';
  NW := '分角元拾佰仟萬拾佰仟億拾佰仟萬';
  NA := FloatToStr(NN * 100);
  LA := length(NA);
  X := 1;
  HZ := '';
  while X<=LA do
  begin
    NK := Ord(NA[x]) - Ord('0');
    N1 := Copy(NS, NK * 2 + 1, 2);
    N2 := Copy(NW, LA * 2 + 1 - X * 2, 2);
    if (NK = 0) AND ((N2 = '億') OR( N2 = '萬') OR( N2 = '元'))then
    begin
      if copy(HZ,Length(HZ)-1,2) = '零' then
        HZ := copy(HZ, 1, length(HZ) - 2);
      if copy(HZ, Length(HZ) - 1, 2) = '億' then
        if N2 = '元' then
        begin
          N1 := N2;
          N2 := '零';
        end
        else
          N2 := ''
      else
      begin
        N1 := N2;
        N2 := '零';
      end
    end
    else if NK=0 then
    begin
      if copy(HZ, length(HZ) - 1, 2)='零' then
        N1 := '';
      if N2='分' then
      begin
        if copy(HZ, length(HZ) - 1, 2)='零' then
          HZ := copy(HZ, 1, length(HZ) - 2) + '整'
        else
          HZ := HZ + '整';
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
  {------- 修改參數令值更精確 -------}
  {小數點後的位數，需要的話也可以改動該值}
  qianwei:=-2;

  {轉換成貨幣形式，需要的話小數點後加多幾個零}
  Smallmonth:=formatfloat('0.00',small);
  {---------------------------------}

  dianweizhi :=pos('.',Smallmonth);{小數點的位置}

  {循環小寫貨幣的每一位，從小寫的右邊位置到左邊}
  for qian:=length(Smallmonth) downto 1 do
    begin
      {如果讀到的不是小數點就繼續}
      if qian<>dianweizhi then
        begin
          {位置上的數轉換成大寫}
          case strtoint(copy(Smallmonth,qian,1)) of
            1:wei1:='壹'; 2:wei1:='貳';
            3:wei1:='參'; 4:wei1:='肆';
            5:wei1:='伍'; 6:wei1:='陸';
            7:wei1:='柒'; 8:wei1:='捌';
            9:wei1:='玖'; 0:wei1:='零';
          end;
          {判斷大寫位置，可以繼續增大到real類型的最大值，可是誰有那麼多錢}
          case qianwei of
            -3:qianwei1:='釐';
            -2:qianwei1:='分';
            -1:qianwei1:='角';
            0 :qianwei1:='元';
            1 :qianwei1:='拾';
            2 :qianwei1:='佰';
            3 :qianwei1:='千';
            4 :qianwei1:='萬';
            5 :qianwei1:='拾';
            6 :qianwei1:='佰';
            7 :qianwei1:='千';
            8 :qianwei1:='億';
            9 :qianwei1:='拾';
            10:qianwei1:='佰';
            11:qianwei1:='千';
          end;
      inc(qianwei);
      BigMonth :=wei1+qianwei1+BigMonth;{組合成大寫金額}
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
  dx:='零壹貳參肆伍陸柒捌玖';
  ws:='分角元拾佰仟萬拾佰仟億拾佰仟';
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
  //獲得整數部分
  IntPart := Trunc(Abs(AValue));
  //獲得兩位小數部分
  //此處出現舍入異常，即舍入的結果無法預料，多謝
  //DFW上的sichuan發現此錯誤，在此進行修正
  //FracPart := Round(Frac(Abs(AValue)) * 100);
  //修正後的語句
  //FracPart := Trunc(Abs(AValue) * 100 + 1e-5) mod 100;
  //格式化整數部分
  ts := FormatFloat('0.00', AValue);
  dts := Pos('.', ts);
  rs := LzhFmtInt(IntPart) + CrNa[1];
  //Jiao := FracPart div 10 mod 10;
  Jiao := Ord(ts[dts + 1]) - Ord('0');
  //Fen := FracPart mod 10;
  Fen := Ord(ts[dts + 2]) - Ord('0');
  FracPart := Jiao * 10 + Fen;
  //如果個位為零且大於零，則補零
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
  //獲得整數部分
  IntPart := Abs(AValue) div 100;
  //獲得兩位小數部分
  FracPart := Abs(AValue) mod 100;
  //格式化整數部分
  rs := LzhFmtInt(IntPart) + CrNa[1];
  Jiao := FracPart div 10 mod 10;
  Fen := FracPart mod 10;
  //如果個位為零且大於零，則補零
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
    //超出數的預定義範圍，則直接返回空值
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
  //限制為18位數
  if IntValue < 0 then rs := DP[12];
  IntValue := Abs(IntValue);
  //輸入的數值應小於800兆，也就是8e18;
  if IntValue > 8000000000000000000 then
  begin
    Result := '';
    Exit;
  end;
  bi := IntToStr(IntValue);
  //格式化為
  bi := StringOfChar('0', 20 - Length(bi)) + bi;
  //從左側開始格式化
  LastBt := ' ';
  LastHit := 0;
  reach := False;
  for i := 1 to 20 do
  begin
    //如果非0
    if (bi[i] >= '1') and (bi[i] <= '9') then
    begin
      //如果前一位是0,又不到分界位，補零
      if reach and (LastBt = '0') and (i mod 4 <> 1) then
      begin
        rs := rs + DP[1];
      end;
      reach := True;
      //轉換數字,如果是十位，且前一位為0
      if SoftTone and (i mod 4 = 3) and (LastBt = '0')
        and ((not reach) or (bi[i] = '1')) then
      else
      begin
        rs := rs + DP[(Ord(bi[i]) - Ord('0')) mod 10 + 1];
      end;
      //添加位名
      n := (20 - i) mod 20 + 1;
      if n > 1 then
      begin
        rs := rs + DN[n];
      end;
      LastHit := 20 - i;
    end;
    //分界名
    if (bi[i] = '0') and (i mod 4 = 0) and reach then
    begin
      //特殊分界處的顯示原則，8位前為空的不顯示分界名
      //不是8位處的，4位前為空不顯示分界名
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
