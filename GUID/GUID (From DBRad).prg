How to get the 8-byte time-stamped unique value GUID

*************************************************************************** 
*** GUID - Global Unique IDentifier generator,  (c) Dmitri Bayanov, 1996, dbrad32@mail.ru ***
*************************************************************************** 
Functions:
*** 1. Guid()
*** 2. IsGuidOlder()
*** 3. NumFromGuid()
*** 4. DatFromGuid()
*** 5. IniGenGuid()
*** 6. GetUniString()
*** 7. NumToB()
*** 8. BToNum()
*** 9. Tic96()
*** 10.Tic96n()

*************************************************************************** 
*** Test it - just run this file
Local cBuf
=IniGenGuid()
 cBuf=GUID()
 =MessageBox("It's the GUID value:"+cBuf+chr(10)+chr(13)+;
            "And it's a date, recovered from GUID: "+DTOC(DatFromGuid(cBuf)))
Return


*************************************************************************** 
** Function GUID() - returns 8-byte unique value 
*** GUID() - function from Time (with a speed of response no less 0,1 ms) and Dynamic Random code
*** Also DatFromGuid() is available - recovers date from GUID value
*** At the begining of your app You should call  IniGenGuid() - to initialize GUID generator
*** Attn: primary key field is recommended to create with a NOCPTRANS parameter


*** You have to to include the next functions code into your program code:


*************************************************************************** 
*** GUID generator initialization 
Function IniGenGuid
Public UniString_, nd96s_, nd96d_, nStartDate_ && counters
Local cBuf
 nStartDate_ = VAL(SYS(11,CTOD("01/01/2000"))) && starting counter date
 nd96s_=0
 nd96d_=0
 *** Character chain loading - for hight-numeric number imaging
 UniString_=GetUniString() && save string as public variable
nd96s_=Tick96() && triggering last tick value
=Rand(-1) && ini Random generator by system clock
RETURN

*************************************************************************** 
*** The main function. To obtain the unique GUID value = Time+RandomCode
** First six bytes are also the timestamp value
Function GUID
* 6byte - time & co-unique counters + 2byte randomized code
Return PADR(PADL(NumtoB(Tick96n()),6)+PADR(NumToB(RAND()*10**4),2,'*'),8,'!')


*************************************************************************** 
*** To recover decimal number from GUID 
* (ticks + 2position for seconds + 2 position for additional counique counter)
Function NumFromGuid(cGuid)
RETURN BTONum(SUBSTR(cGuid,1,6))


*************************************************************************** 
* To recover the date from Guid value
Function DatFromGuid(cB)
Local nTick, dDate
nTick=BTONum(ALLTRIM(SUBSTR(cb,1,6)))
nTick=nTick/100 && trim 2 position by additional counique counter 
dDate=INT(nTick/8640000) && days
dDate=CTOD(SYS(10,dDate+nStartDate_))
RETURN dDate


*************************************************************************** 
* To detect whether cGuid1 value is older (Time-Stamp comparing)
Function IsGuidOlder(cGuid1,cGuid2)
RETURN NumFromGuid(cGuid1) > NumFromGuid(cGuid2)


*************************************************************************** 
*** Unique character chain building as a large base of a numeric system
Function GetUniString
Local cUniS,ni
    && cUnis - array to image the digits in a large base == LEN(cInis)
    && removed the next chars: [0-34]  '"[]&   (39,34,91,93) 
    *** compiling the array
            cUnis=chr(35)+chr(36)+chr(37) && +chr(38) - "&"
   For ni=40 to 90
       cUniS=cUniS+chr(ni)
   EndFor
            cUniS=cUniS+chr(92)
   For ni=94 to 126
       cUniS=cUniS+chr(ni)
   EndFor
   For ni=192 to 255
       cUniS=cUniS+chr(ni)
   EndFor
Return cUniS


*************************************************************************** 
*** To get the number of ticks since nStartDate_  
* (with accuracy = 10 ms, 'couse NT not allows better) 
* 6 byte - it's enough to store the ticks within 20 years 
* nStartDate_ - days number of days till nStartDate_ (01.01.2000)
Function Tick96
return int(((val(sys(11,date())) - nStartDate_))*8640000+seconds()*100)


*************************************************************************** 
*** To obtain the unique counter value in ticks - Tick96 value + additional counique counter
* Within current tick period more than one value call may be demanded
* so we should create additional counter. For further we can increase it capacity more 99
Function Tick96N
Local nNew,nNewS
 nNewS=Tick96()
  IF nNewS==nd96s_ && we in a current tick while
    IF nd96d_==99 && counter is exceeded - we'll waiting for a new tick
       DO WHILE nNewS==nd96s_
         nNewS=Tick96()
       ENDDO
      nd96d_=0
    ELSE
      nd96d_=nd96d_+1 && we have a spare counter value - increment it
    ENDIF  
  ELSE && new tick
    nd96d_=0  
  ENDIF
       nNew=nNewS*100+nd96d_  && new id getting
       nd96s_=nNewS
return (nNew)


*************************************************************************** 
*** To convert decimal number into number with other base (as length of UniString_)
* As a matter of fact, it's a digit simbol set in compact string value
* Used digit images are stored in UniString_, keeping ascending order in ASC values
* (c) Dm.Bayanov 1997
* (similar native VFP BinToC() function terminates when exceeds 9 digit)
* reversal converstion will - BtoNum
*** Examples of different Base of Numeric System imagination
*UniString_="01" - binary base
*UniString_="0123456789" - decimal base 10
*UniString_="0123456789ABCDEF" - hexagonal base
*UniString_="01234567890ABCDEFGHIJKLMNOP......CHR(255)" - base ~ 150
Function NumtoB(nNum)
Local cBuf,ni,nOst,nTail,nOsn,nWeight, nNum, nLen, cUniStr
cBuf=""
nOst=0
nTail=0
nLen=1
cUniStr=UniString_
*** Base = nOsn
nOsn=Len(cUniStr)&&-1 && visual digits array
*** Getting the number of numeric grade in final number (ex.999>123)
DO WHILE .T.
    nOst=nOst+(nOsn-1)*nOsn**(nLen-1)
 IF nOst >= nNum
   EXIT
 ENDIF
  nLen=nLen+1
ENDDO
   FOR ni=1 TO nLen
     nOst=nNum-nTail
     * the weight of every ni Grade can have the value since minor character till major in UniString_
     nWeight=INT(nOst/nOsn**(nLen-ni))
      * current rest value right to current digit grade
     nTail=nTail+nWeight*nOsn**(nLen-ni)
         *  exstracting digital character corresponding grade weight from UniStr
         * nWeight+1 for the sake of  getting nWeight==0 character
        cBuf=cBuf+SUBSTR(cUniStr,nWeight+1,1)
   NEXT
RETURN cBuf


*************************************************************************** 
** Reverse string conversation into decimal value
Function BtoNum(cB)
Local ni,nj,nOst,nk,nOsn,cCim,cUniStr
nOst=0
cUniStr=UniString_
nOsn=LEN(cUniStr)
FOR ni=1 TO LEN(cB)
  cCim=SUBSTR(cb,LEN(cb)-ni+1,1)
  nk=AT(cCim,cUniStr)-1
  nOst=nOst+nk*(nOsn**(ni-1))
NEXT
RETURN nOst