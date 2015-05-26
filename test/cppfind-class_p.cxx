/****************************************************************************
**
** Author: Miroslav Safr <miroslav.safr@gmail.com>
** c++ strings manipulation test 2
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


class Sum
{
public:
	Sum() : _a(0), b(0) {}
	void setA(int a) { _a = a; }
	void setB(int b) { _b = b; }
	int setSum(int a) { return (a + b); }
private:
	// comments for later use Testing string2find
	int _a,_b;
};

