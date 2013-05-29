/****************************************************************************
**
** Author: Miroslav Safr <miroslav.safr@gmail.com>
** c++ strings manipulation test
**
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
****************************************************************************/

#include <cstdlib>
#include <cstdio>
#include <cstring>

void copy_str(char* pChar)
{
	char buffer [20]={'\0'};
	size_t uiChar20 = sizeof(buffer);     //20
	size_t uiCharPointer = sizeof(pChar); //4
	size_t uiCharValue = sizeof(*pChar);  //1
	size_t uiCharStrlen = strlen(pChar);  //
	printf("Exp:Buffer size:20, char*:4, *(char*):1, strlen:15 \n");
	printf("Act:Buffer size:%d, char*:%d, *(char*):%d, strlen:%d\n", uiChar20, uiCharPointer, uiCharValue, uiCharStrlen );

	strncpy(buffer,pChar,20);
	printf(buffer);
        printf("\n");

}

int main( int argc, char *argv[ ] )
{
	//String2Find
	char mainBuffer[20] ={'\0'};
        size_t uiCharSize = sizeof(char); //1
	size_t uiChar8 = sizeof(mainBuffer); //8
        snprintf(mainBuffer,uiChar8,"Testing string2find");
	copy_str(&mainBuffer[0]);
}

