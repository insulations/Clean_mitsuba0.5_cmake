/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtXmlPatterns module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.

#ifndef Patternist_Base64Binary_H
#define Patternist_Base64Binary_H

#include "qitem_p.h"

QT_BEGIN_HEADER

QT_BEGIN_NAMESPACE

namespace QPatternist
{

    /**
     * @short Implements the value instance of the @c xs:base64Binary type.
     *
     * @author Frans Englich <frans.englich@nokia.com>
     * @ingroup Patternist_xdm
     */
    class Base64Binary : public AtomicValue
    {
    public:
        friend class CommonValues;

        typedef AtomicValue::Ptr Ptr;

        /**
         * Creates an instance representing @p value.
         */
        static AtomicValue::Ptr fromLexical(const QString &value);

        static Base64Binary::Ptr fromValue(const QByteArray &data);

        virtual QString stringValue() const;
        virtual ItemType::Ptr type() const;
        inline const QByteArray &asByteArray() const
        {
            return m_value;
        }

    protected:
        Base64Binary(const QByteArray &val);

        const QByteArray m_value;

    private:
        /**
         * @short Assumes @p in is a lexical representation of @c xs:base64Binary, and
         * converts it to the binary data set in @p out.
         *
         * If @p instr is invalid Base64 content, @p ok is set to
         * false, and the returned QByteArray has an undefined value.
         *
         *  We cannot use QByteArray::fromBase64() because it doesn't do the
         *  necessary validation that we need to properly implement W3C XML
         *  Schema's xs:base64Binary type.
         */
        static void base64Decode(const QByteArray &in, QByteArray &out, bool &ok);

        static const char Base64DecMap[128];
    };
}

QT_END_NAMESPACE

QT_END_HEADER

#endif
