**************************************************************************
*! Copyright by Anjel, 2005
*! 
*! ����� ���������� Globally Unique Identifier
*! 
*! ������������ ���������:
*! ��������� ����������� �������������� GUID
*! � by ������ �.�. ��������� ��������������� �����������, 1997
*! 
**************************************************************************

#ifdef MS_PER_DAY
	#undef MS_PER_DAY
#endif

#define MS_PER_DAY		8640000		&& ���������� ���������� � ������

define class GUID_Class as Custom 

	hidden UniString_ 		&& ������ ������ �����������
	hidden nStartDate_ 	&& ���� ������ �������
	hidden nd96s_ 
	hidden nd96d_ 
	hidden Hid2_Guid_ 

	*! 
	*! ���������� ������� ������
	*! 
	
	&& ���������� ������� �������� ��� ����������� ����
	hidden function GetUniString() as String 
	local cUniS, ni
		&& cUniS - ����� ������ ��� ���������������� � ���������� len(cinis)
		&& ��������� �������: [0 - 34] ' " [ ] & (38, 39, 91, 93)
		*! ������ ������
		cUniS = Chr(35) + Chr(36) + Chr(37)
		for ni=40 to 90
			cUniS = cUniS + Chr(ni)
		next

		cUniS = cUniS + Chr(92)
		for ni=94 to 128
			cUniS = cUniS + Chr(ni)
		next
	
		for ni=192 to 255
			cUniS = cUniS + Chr(ni)
		next
	return cUniS

	**************************************************************************
	*! �������������� ����� nNum � ������ �������� 
	*! �.�. �������� ����� � ������ �������� 
	*! (������ BinToC), �� ������������ ������� ��������
	**************************************************************************
	hidden function NumToB(nNum as Long) as String 
	local cBuf, ni, nOst, nTale, nOsn, nVes, nNum, nLen
		cBuf = ""
		nOst = 0
		nTale = 0
		nLen = 1
		nOsn = Len(this.UniString_)	&& ��������� ��������� ����� - ����� ���. ������ �����������
		&& ���. ���������� �������� � �������� �����
		do while .t.
			nOst = nOst+(nOsn-1)*nOsn**(nLen-1)
			if nOst >= nNum
				exit
			endif
			nLen = nLen + 1 
		enddo
		for ni=1 to nLen
			nOst = nNum - nTale
			&& ��� ni ������� - ������ ������ ����� ��������� �������� �� ��������
			&& �� �������� �������� cUniStr
			nVes = Int(nOst/nOsn**(nLen-ni))
			&& ������� ������� �� ������� ���. �������
			nTale = nTale+nVes*nOsn**(nLen-ni)
			&& ������� ������ �� ���� ������� nVes++ ��� ����� �� nVes==0
			cBuf = cBuf+Substr(this.UniString_, nVes+1, 1)
		next
	return cBuf

	**************************************************************************
	*! �������� �������������� ������ � �����
	**************************************************************************
	hidden function BToNum(cB as String) as Long 
	local ni, nOst, nk, nOsn, cCim

		nOst = 0
		nOsn = Len(this.UniString_)
	
		for ni=1 to Len(cB)
			cCim = Substr(cB, Len(cB)-ni+1, 1)
			nk = At(cCim, this.UniString_)-1
			nOst = nOst+nk*(nOsn**(ni-1))
		next
	return nOst

	**************************************************************************
	*! �������� ����� �����, ��������� �� ��������� ����
	*! 6 - ���� ������ �� 20 ���
	**************************************************************************
	hidden function Tic96() as Long 
	return Int(100*Seconds() + MS_PER_DAY*(Val(Sys(11,Date()))-this.nStartDate_))

	**************************************************************************
	*! ��������� ����������� ����� - ���� Tic96 + �������-����������
	*! �.�. �� ���� ��� Tic96 ����� ���� ������ ��������� ��� - ������
	*! �������������� �������
	**************************************************************************
	hidden function Tic96N() as Long 
	local nNew, nNewS
		nNewS = this.Tic96()
		if nNewS == this.nd96s_		&& ������ ���
			if this.nd96d_ == 99 	&& ������ �������� - ����� ����� �����������
				do while nNewS==this.nd96s_
					nNewS = this.Tic96()
				enddo
				this.nd96d_ = 0
			else 
				this.nd96d_ = this.nd96d_ + 1 && ��������� �������
			endif 
		else					&& ������ ���
			this.nd96d_ = 0
		endif
		nNew = nNewS*100+this.nd96d_	&& ����� id
		this.nd96s_ = nNewS
	return (nNew)

	*! 
	*! ������� ��������� ������������
	*! 

	**************************************************************************
	*! ������������� ��������� ��������
	**************************************************************************
	procedure Init()
	local cBuf
		&& ��������� ������������� ������
		this.nStartDate_ = Val(Sys(11,Ctod("01/01/2005")))	&& ������ �������
		this.nd96s_ = 0
		this.nd96d_ = 0
		this.UniString_ = this.GetUniString()
		cBuf = Sys(0)+Sys(2020)	&& id - ����������
		cBuf = cBuf + Sys(2015)	&& ��������� ���������� ��� ������ (���� ��� ������ ����� ��������� unique)
		this.Hid2_Guid_ = Padr(this.NumToB(Val(Sys(2007,cBuf))/3), 2, '*')
		this.nd96s_ = this.Tic96()	&& ��������� "���"
	return
	
	**************************************************************************
	*! ������������ ���� ��������� �� GUID
	**************************************************************************
	function DateFromGUID (cB as String) as Date 
	local nTic, dDate
		nTic = this.BToNum(Alltrim(Substr(cB, 1, 6)))
		nTic = nTic / 100
		dDate = Int(nTic/MS_PER_DAY)	&& ���
		dDate = Ctod(Sys(10, dDate+this.nStartDate_))
	return dDate
	
	**************************************************************************
	*! ������������ ���������� ����� �� GUID
	**************************************************************************
	function NumFromGUID(cB as String) as Long 
	return this.BToNum(Substr(cB, 1, 6))
	
	**************************************************************************
	*! ��������� ��������������
	**************************************************************************
	function GUID() as String 
	return Padr(Padl(this.NumToB(this.Tic96N()), 6)+this.Hid2_Guid_, 8, "!")
	
enddefine

#undef MS_PER_DAY

