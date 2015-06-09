// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

class Test
{
public:
	Test() : iTest(0) { }
	int getI()  { return m_i; }
	const char* getString()  { return "String2Find"; }
private:
	int m_i;
};
