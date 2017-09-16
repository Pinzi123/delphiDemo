unit CnDigits;
{--------------------------------------------------------------------
³f¹ô¼Æ¦rÂà¬°¬°¤¤¤å¤j¼gªº²Õ¥ó Version 1.31
                          by lichaohui 2003.4.13

Â²¤¶:
    ¥i¥HÂà¤Æ¾ã¼Æ¡A¯BÂI¼Æ¡A¤Î®É¶¡¤é´Á«¬¼Æ¾Ú
    °t¦X§O¦W¦Cªí¥i¥H¶i¦æ»y­µ¦X¦¨¡A¥D­n¥Î©ó
    ªF¶i¤¤Ä~¥d¤¤ªºPlayPrompt´£¥Ü»y­µªº¦X¦¨
    ¥Î©ó¹q¸ÜÃ´²Î¤¤¼½©ñª÷ÃB¡A¤é´Á¤Î®É¶¡
    ÁÙ¦³¿é¤Jªº¼Æ¦r§Ç¦C¡A¦P®É§ó¦hªºÀ³¥Î©óÅã¥Ü
    ¾P°âÃ´²Î¤¤ªº¥´¦Lµo²¼®Éªº¤¤¤å¤j¼gª÷ÃB¦r¬q

email:
¢ô¢ñ¡Z¢þ¢ñ¢÷¢ô¢í¢ü¢ë¢ö¢I£B¢é¢ð¢÷¢÷¡O¢ë¢÷¢õ¡O¢ë¢ö

¨Ó¦Û¡G¤p½Þ, ®É¶¡¡G2003-4-14 13:44:00, ID¡G1767011
to¡GLiChaoHui

¨S¦³²ßºD¡A¦³³W©w¡C
µ¹§A¬Ý¬Ý¤H¥Á»È¦æªº³W©w§a¡]»¡¤£©w§AÁÙ±o§ï§ï^_^¡^¡C

¥¿½T¶ñ¼g²¼¾Ú©Mµ²ºâ¾ÌÃÒªº°ò¥»³W©w

    »È¦æ¡B³æ¦ì©M­Ó¤H¶ñ¼gªº¦UºØ²¼¾Ú©Mµ²ºâ¾ÌÃÒ¬O¿ì²z¤ä¥Iµ²ºâ©M²{ª÷¦¬¥I
ªº­«­n¨Ì¾Ú¡Aª½±µÃöÃ´¨ì¤ä¥Iµ²ºâªº·Ç½T¡B¤Î®É©M¦w¥þ¡C²¼¾Ú©Mµ²ºâ¾ÌÃÒ¬O»È
¦æ¡B³æ¦ì©M­Ó¤H¾Ì¥H°O¸ü½ã°Èªº·|­p¾ÌÃÒ¡A¬O°O¸ü¸gÀÙ·~°È©M©ú½T¸gÀÙ³d¥ôªº
¤@ºØ®Ñ­±ÃÒ©ú¡C¦]¦¹¡A¶ñ¼g²¼¾Ú©Mµ²ºâ¾ÌÃÒ¡A¥²¶·°µ¨ì¼Ð·Ç¤Æ¡B³W½d¤Æ¡A­n­n
¯À»ô¥þ¡B¼Æ¦r¥¿½T¡B¦r¸ñ²M´·¡B¤£¿ùº|¡B¤£¼ã¯ó¡A¨¾¤î¶î§ï¡C
    ¤@¡B¤¤¤å¤j¼gª÷ÃB¼Æ¦rÀ³¥Î¥¿·¢©Î¦æ®Ñ¶ñ¼g¡A¦p³ü¡]³ü¡^¡B¶L¡]¶L¡^¡B°Ñ¡B
¸v¡]¸v¡^¡B¥î¡]¥î¡^¡B³°¡]³°¡^¡B¬m¡B®Ã¡B¨h¡B¬B¡B¨Õ¡B¥a¡B¸U¡]¸U¡^¡B»õ¡B
¤¸¡B¨¤¡B¤À¡B¹s¡B¾ã¡]¥¿¡^µ¥¦r¼Ë¡C¤£±o¥Î¤@¡B¤G¡]¨â¡^¡B¤T¡B¥|¡B¤­¡B¤»¡B
¤C¡B¤K¡B¤E¡B¤Q¡B©À¡B¤ò¡B¥t¡]©Î0¡^¶ñ¼g¡A¤£±o¦Û³yÂ²¤Æ¦r¡C¦pªGª÷ÃB¼Æ¦r
®Ñ¼g¤¤¨Ï¥ÎÁcÅé¦r¡A¦p¤a¡B  ¡Bƒ|¡B®¨¡BˆAªº¡A¤]À³¨ü²z¡C
    ¤G¡B¤¤¤å¤j¼gª÷ÃB¼Æ¦r¨ì¡§¤¸¡¨¬°¤îªº¡A¦b¡§¤¸¡¨¤§«á¡AÀ³¼g¡§¾ã¡¨
¡]©Î¡§¥¿¡¨¡^¦r¡A¦b¡§¨¤¡¨¤§«á¥i¥H¤£¼g¡§¾ã¡¨¡]©Î¡§¥¿¡¨¡^¦r¡C¤j¼gª÷ÃB¼Æ
¦r¦³¡§¤À¡¨ªº¡A¡§¤À¡¨«á­±¤£¼g¡§¾ã¡¨¡]©Î¡§¥¿¡¨¡^¦r¡C
    ¤T¡B¤¤¤å¤j¼gª÷ÃB¼Æ¦r«eÀ³¼Ð©ú¡§¤H¥Á¹ô¡¨¦r¼Ë¡A¤j¼gª÷ÃB¼Æ¦rÀ³ºò±µ
¡§¤H¥Á¹ô¡¨¦r¼Ë¶ñ¼g¡A¤£±o¯d¦³ªÅ¥Õ¡C¤j¼gª÷ÃB¼Æ¦r«e¥¼¦L¡§¤H¥Á¹ô¡¨¦r¼Ëªº¡A
À³¥[¶ñ¡§¤H¥Á¹ô¡¨¤T¦r¡C¦b²¼¾Ú©Mµ²ºâ¾ÌÃÒ¤j¼gª÷ÃBÄæ¤º¤£±o¹w¦L©T©wªº¡§¥a¡B
¨Õ¡B¬B¡B¸U¡B¥a¡B§B¡B¬B¡B¤¸¡B¨¤¡B¤À¡¨¦r¼Ë¡C
    ¥|¡Bªü©Ô§B¤p¼gª÷ÃB¼Æ¦r¤¤¦³¡§0¡¨®É¡A¤¤¤å¤j¼gÀ³«ö·Óº~»y»y¨¥³W«ß¡B
ª÷ÃB¼Æ¦rºc¦¨©M¨¾¤î¶î§ïªº­n¨D¶i¦æ®Ñ¼g¡CÁ|¨Ò¦p¤U¡G
    ¡]¤@¡^ªü©Ô§B¼Æ¦r¤¤¶¡¦³¡§O¡¨®É¡A¤¤¤å¤j¼gª÷ÃB­n¼g¡§¹s¡¨¦r¡C¦p
          ¢D1¡A409¡O50¡AÀ³¼g¦¨¤H¥Á¹ô³ü¥a¸v¨Õ¹s¨h¤¸¥î¨¤¡C
    ¡]¤G¡^ªü©Ô§B¼Æ¦r¤¤¶¡³sÄò¦³´X­Ó¡§0¡¨®É¡A¤¤¤å¤j¼gª÷ÃB¤¤¶¡¥i¥H°¦¼g
          ¤@­Ó¡§¹s¡¨¦r¡C¦p¢D6¡A007¡O14¡AÀ³¼g¦¨¤H¥Á¹ô³°¥a¹s¬m¤¸³ü¨¤¸v¤À¡C
    ¡]¤T¡^ªü©Ô§Bª÷ÃB¼Æ¦r¸U¦ì©Î¤¸¦ì¬O¡§0¡¨¡A©ÎªÌ¼Æ¦r¤¤¶¡³sÄò¦³´X­Ó¡§0¡¨¡A
          ¸U¦ì¡B¤¸¦ì¤]¬O¡§0¡¦¡A¦ý¤d¦ì¡B¨¤¦ì¤£¬O¡§0¡¨®É¡A¤¤¤å¤j¼gª÷ÃB¤¤
          ¥i¥H°¦¼g¤@­Ó¹s¦r¡A¤]¥i¥H¤£¼g¡§¹s¡¨¦r¡C¦p¢D1¡A680¡O32¡AÀ³¼g¦¨
          ¤H¥Á¹ô³ü¥a³°¨Õ®Ã¬B¤¸¹s°Ñ¨¤¶L¤À¡A©ÎªÌ¼g¦¨¤H¥Á¹ô³ü¥a³°¨Õ®Ã¬B¤¸
          °Ñ¨¤¶L¤À¡F¤S¦p¢D107¡A000¡O53¡AÀ³¼g¦¨¤H¥Á¹ô³ü¬B¸U¬m¥a¤¸¹s¥î¨¤
          °Ñ¤À¡A©ÎªÌ¼g¦¨¤H¥Á¹ô³ü¬B¸U¹s¬m¥a¤¸¥î¨¤°Ñ¤À¡C
    ¡]¥|¡^ªü©Ô§Bª÷ÃB¼Æ¦r¨¤¦ì¬O¡§0¡¨¡A¦Ó¤À¦ì¤£¬O¡§0¡¨®É¡A¤¤¤å¤j¼gª÷ÃB
          ¡§¤¸¡¨«á­±À³¼g¡§¹s¡¨¦r¡C¦p¢D16¡A409.02¡AÀ³¼g¦¨¤H¥Á¹ô³ü¸U³°
          ¥a¸v¨Õ¹s¨h¤¸¹s¶L¤À¡F¤S¦p¢D325¡O04¡AÀ³¼g¦¨¤H¥Á¹ô°Ñ¨Õ¶L¬B¥î¤¸
          ¹s¸v¤À¡C
    ¤­¡Bªü©Ô§B¤p¼gª÷ÃB¼Æ¦r«e­±¡A§¡À³¶ñ¼g¤J¥Á¹ô²Å¸¹¡§¢D¡¨¡]©Î¯ó¼g¡G¡^¡C
ªü©Ô§B¤p¼gª÷ÃB¼Æ¦r­n»{¯u¶ñ¼g¡A¤£±o³s¼g¤À¿ë¤£²M¡C
    ¤»¡B²¼¾Úªº¥X²¼¤é´Á¥²¶·¨Ï¥Î¤¤¤å¤j¼g¡C¬°¨¾¤îÅÜ³y²¼¾Úªº¥X¸[¤é´Á¡A¦b
¶ñ¼g¤ë¡B¤é®É¡A¤ë¬°³ü¡B¶L©M³ü¬Bªº¡A¤é¬°³ü¦Ü¨h©M³ü¬B¡B¶L¬B©M°Ñ©ïªº¡AÀ³
¦b¨ä«e¥[¡§¹s¡¨¡F¤é¬°©ï³ü¦Ü¬B¨hªº¡AÀ³¦b¨ä«e¥[¡§³ü¡¨¡C¦p1¤ë15¤é¡AÀ³¼g¦¨
¹s³ü¤ë³ü¬B¥î¤é¡C¦A¦p10¤ë20¤é¡AÀ³¼g¦¨¹s³ü¬B¤ë¹s¶L¬B¤é¡C
    ¤C¡B²¼¾Ú¥X²¼¤é´Á¨Ï¥Î¤p¼g¶ñ¼gªº¡A»È¦æ¤£¤©¨ü²z¡C¤j¼g¤é´Á¥¼«ö­n¨D³W½d
¶ñ¼gªº¡A»È¦æ¥i¤©¨ü²z¡A¦ý¥Ñ¦¹³y¦¨·l¥¢ªº¡A¥Ñ¥X²¼¤J¦Û¦æ©Ó¾á¡C
--------------------------------------------------------------------}
{ $message 'NOTICE: uncomment following line to discard unused code !'}
{ $message 'ª`·N: ¥h±¼¤U­±³o¤@¦æ¡A¥i¥H©ß±ó¦¬¶°ªº¨ä¥¦¥N½X'}
// {$define discard_other_code}

interface

uses
  Windows, Messages, SysUtils, Classes, Math;

type
  //Ãþ«¬©w¸q
  TDate = TDateTime;
  TTime = TDateTime;

  { ¤¤¤å¼Æ¦r¤j¼g²Õ¥ó by lichaohui }

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
    //¤U­±¬O¨v·¨ªº°Ó³õºÞ²z·½½X¤¤ªº¥N½X
    //ªð¥[¤H¥Á¹ôªº¤¤¤å¼Æ­È
    class function other_RMB(NN:real):string;
    //¨ä¥¦ªº¨â­Ó¤èªk
    class function other_SmallTOBig(small: real): string;
    class function other_XD(xx: currency): string;
    {$endif}
    //¤U­±¬Olichaohuiªº¤u¨ã¨ç¼Æ
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
    //±`¥Î¤èªk½Õ¥Î±µ¤f
    function ChineseUpper(Curr: Currency): String;
    function ChineseDate(ADate: TDate;
      DigitsYear: Boolean = False): String;
    function ChineseTime(ATime: TTime;
      HasSecond: Boolean = False): String;
    //µ¥»ù§O¦WÂà¤Æ
    function StrToAlias(S: String): String;
    function StrToAlias2(S: String): String;
    //ºc³y©MªRºc¨ç¼Æ
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CurrencyValue: Currency read FCurrVa write SetCurrVa;
    property CnUpperDigits: String read FCnUpDigits write SetCnUP stored False;
    property Alias: TStrings read FAlias write SetAlias;
    property DefaultAlias: Boolean read Fda write SetDA;
  end;

const
  DP: WideString = '¹s³ü¶L°Ñ¸v¥î³°¬m®Ã¨h¨â­t';
  DN: WideString = 'ÂI¬B¨Õ¥a¸U¬B¨Õ¥a»õ¬B¨Õ¥a¸U¬B¨Õ¥a¥ü¬B¨Õ¥a';
  CrNa: WideString = '¤¸¨¤¤À¾ã';
  DtNa: WideString = '¦~¤ë¤é®É¤À¬í';

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
  //¦¹¦æ¥N½X¬O¬°¤F­×¥¿¤p¼Æ¦ì¦h©ó¨â¦ì®É¥Í¦¨ªºµ²ªGªº¿ù»~
  NN := Int(NN * 100) / 100;
  //¤U­±ªº¥N½X³Qlichaohui®æ¦¡¤Æ¾ã²z
  if NN > 9999999999999.99 then
  begin
    //MessageDlg('ª÷ÃB·¸¥X¡C',mtError,[mbOk], 0);
    HZ := '';
    Result := HZ;
    exit;
  end;
  if NN = 0 then
  begin
    HZ := '¹s¤¸';
    result := HZ;
    exit;
  end;
  NS := '¹s³ü¶L°Ñ¸v¥î³°¬m®Ã¨h';
  NW := '¤À¨¤¤¸¬B¨Õ¥a¸U¬B¨Õ¥a»õ¬B¨Õ¥a¸U';
  NA := FloatToStr(NN * 100);
  LA := length(NA);
  X := 1;
  HZ := '';
  while X<=LA do
  begin
    NK := Ord(NA[x]) - Ord('0');
    N1 := Copy(NS, NK * 2 + 1, 2);
    N2 := Copy(NW, LA * 2 + 1 - X * 2, 2);
    if (NK = 0) AND ((N2 = '»õ') OR( N2 = '¸U') OR( N2 = '¤¸'))then
    begin
      if copy(HZ,Length(HZ)-1,2) = '¹s' then
        HZ := copy(HZ, 1, length(HZ) - 2);
      if copy(HZ, Length(HZ) - 1, 2) = '»õ' then
        if N2 = '¤¸' then
        begin
          N1 := N2;
          N2 := '¹s';
        end
        else
          N2 := ''
      else
      begin
        N1 := N2;
        N2 := '¹s';
      end
    end
    else if NK=0 then
    begin
      if copy(HZ, length(HZ) - 1, 2)='¹s' then
        N1 := '';
      if N2='¤À' then
      begin
        if copy(HZ, length(HZ) - 1, 2)='¹s' then
          HZ := copy(HZ, 1, length(HZ) - 2) + '¾ã'
        else
          HZ := HZ + '¾ã';
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
  {------- ­×§ï°Ñ¼Æ¥O­È§óºë½T -------}
  {¤p¼ÆÂI«áªº¦ì¼Æ¡A»Ý­nªº¸Ü¤]¥i¥H§ï°Ê¸Ó­È}
  qianwei:=-2;

  {Âà´«¦¨³f¹ô§Î¦¡¡A»Ý­nªº¸Ü¤p¼ÆÂI«á¥[¦h´X­Ó¹s}
  Smallmonth:=formatfloat('0.00',small);
  {---------------------------------}

  dianweizhi :=pos('.',Smallmonth);{¤p¼ÆÂIªº¦ì¸m}

  {´`Àô¤p¼g³f¹ôªº¨C¤@¦ì¡A±q¤p¼gªº¥kÃä¦ì¸m¨ì¥ªÃä}
  for qian:=length(Smallmonth) downto 1 do
    begin
      {¦pªGÅª¨ìªº¤£¬O¤p¼ÆÂI´NÄ~Äò}
      if qian<>dianweizhi then
        begin
          {¦ì¸m¤Wªº¼ÆÂà´«¦¨¤j¼g}
          case strtoint(copy(Smallmonth,qian,1)) of
            1:wei1:='³ü'; 2:wei1:='¶L';
            3:wei1:='°Ñ'; 4:wei1:='¸v';
            5:wei1:='¥î'; 6:wei1:='³°';
            7:wei1:='¬m'; 8:wei1:='®Ã';
            9:wei1:='¨h'; 0:wei1:='¹s';
          end;
          {§PÂ_¤j¼g¦ì¸m¡A¥i¥HÄ~Äò¼W¤j¨ìrealÃþ«¬ªº³Ì¤j­È¡A¥i¬O½Ö¦³¨º»ò¦h¿ú}
          case qianwei of
            -3:qianwei1:='Âç';
            -2:qianwei1:='¤À';
            -1:qianwei1:='¨¤';
            0 :qianwei1:='¤¸';
            1 :qianwei1:='¬B';
            2 :qianwei1:='¨Õ';
            3 :qianwei1:='¤d';
            4 :qianwei1:='¸U';
            5 :qianwei1:='¬B';
            6 :qianwei1:='¨Õ';
            7 :qianwei1:='¤d';
            8 :qianwei1:='»õ';
            9 :qianwei1:='¬B';
            10:qianwei1:='¨Õ';
            11:qianwei1:='¤d';
          end;
      inc(qianwei);
      BigMonth :=wei1+qianwei1+BigMonth;{²Õ¦X¦¨¤j¼gª÷ÃB}
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
  dx:='¹s³ü¶L°Ñ¸v¥î³°¬m®Ã¨h';
  ws:='¤À¨¤¤¸¬B¨Õ¥a¸U¬B¨Õ¥a»õ¬B¨Õ¥a';
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
  //Àò±o¾ã¼Æ³¡¤À
  IntPart := Trunc(Abs(AValue));
  //Àò±o¨â¦ì¤p¼Æ³¡¤À
  //¦¹³B¥X²{ªÙ¤J²§±`¡A§YªÙ¤Jªºµ²ªGµLªk¹w®Æ¡A¦hÁÂ
  //DFW¤Wªºsichuanµo²{¦¹¿ù»~¡A¦b¦¹¶i¦æ­×¥¿
  //FracPart := Round(Frac(Abs(AValue)) * 100);
  //­×¥¿«áªº»y¥y
  //FracPart := Trunc(Abs(AValue) * 100 + 1e-5) mod 100;
  //®æ¦¡¤Æ¾ã¼Æ³¡¤À
  ts := FormatFloat('0.00', AValue);
  dts := Pos('.', ts);
  rs := LzhFmtInt(IntPart) + CrNa[1];
  //Jiao := FracPart div 10 mod 10;
  Jiao := Ord(ts[dts + 1]) - Ord('0');
  //Fen := FracPart mod 10;
  Fen := Ord(ts[dts + 2]) - Ord('0');
  FracPart := Jiao * 10 + Fen;
  //¦pªG­Ó¦ì¬°¹s¥B¤j©ó¹s¡A«h¸É¹s
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
  //Àò±o¾ã¼Æ³¡¤À
  IntPart := Abs(AValue) div 100;
  //Àò±o¨â¦ì¤p¼Æ³¡¤À
  FracPart := Abs(AValue) mod 100;
  //®æ¦¡¤Æ¾ã¼Æ³¡¤À
  rs := LzhFmtInt(IntPart) + CrNa[1];
  Jiao := FracPart div 10 mod 10;
  Fen := FracPart mod 10;
  //¦pªG­Ó¦ì¬°¹s¥B¤j©ó¹s¡A«h¸É¹s
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
    //¶W¥X¼Æªº¹w©w¸q½d³ò¡A«hª½±µªð¦^ªÅ­È
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
  //­­¨î¬°18¦ì¼Æ
  if IntValue < 0 then rs := DP[12];
  IntValue := Abs(IntValue);
  //¿é¤Jªº¼Æ­ÈÀ³¤p©ó800¥ü¡A¤]´N¬O8e18;
  if IntValue > 8000000000000000000 then
  begin
    Result := '';
    Exit;
  end;
  bi := IntToStr(IntValue);
  //®æ¦¡¤Æ¬°
  bi := StringOfChar('0', 20 - Length(bi)) + bi;
  //±q¥ª°¼¶}©l®æ¦¡¤Æ
  LastBt := ' ';
  LastHit := 0;
  reach := False;
  for i := 1 to 20 do
  begin
    //¦pªG«D0
    if (bi[i] >= '1') and (bi[i] <= '9') then
    begin
      //¦pªG«e¤@¦ì¬O0,¤S¤£¨ì¤À¬É¦ì¡A¸É¹s
      if reach and (LastBt = '0') and (i mod 4 <> 1) then
      begin
        rs := rs + DP[1];
      end;
      reach := True;
      //Âà´«¼Æ¦r,¦pªG¬O¤Q¦ì¡A¥B«e¤@¦ì¬°0
      if SoftTone and (i mod 4 = 3) and (LastBt = '0')
        and ((not reach) or (bi[i] = '1')) then
      else
      begin
        rs := rs + DP[(Ord(bi[i]) - Ord('0')) mod 10 + 1];
      end;
      //²K¥[¦ì¦W
      n := (20 - i) mod 20 + 1;
      if n > 1 then
      begin
        rs := rs + DN[n];
      end;
      LastHit := 20 - i;
    end;
    //¤À¬É¦W
    if (bi[i] = '0') and (i mod 4 = 0) and reach then
    begin
      //¯S®í¤À¬É³BªºÅã¥Ü­ì«h¡A8¦ì«e¬°ªÅªº¤£Åã¥Ü¤À¬É¦W
      //¤£¬O8¦ì³Bªº¡A4¦ì«e¬°ªÅ¤£Åã¥Ü¤À¬É¦W
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
