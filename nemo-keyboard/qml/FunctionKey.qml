/*
 * This file is part of Maliit Plugins
 *
 * Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies). All rights reserved.
 *
 * Contact: Mohammad Anwari <Mohammad.Anwari@nokia.com>
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list
 * of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * Neither the name of Nokia Corporation nor the names of its contributors may be
 * used to endorse or promote products derived from this software without specific
 * prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

import Qt 4.7
import "KeyboardUiConstants.js" as UI

Item {
    id: aFunctKey
    property string icon: ""
    property string caption: ""
    property alias mouseArea: mouse_area
    signal clickedPass()
    signal released()
    signal pressedAndHoldPass()


    Image {
        id: leftBit
        source: "meegotouch-keyboard-function-key-left.png"
        anchors { left: parent.left; top: parent.top }
    }
    Image {
        id: midBit
        source: "meegotouch-keyboard-function-key-mid.png"
        anchors { left: leftBit.right; top: parent.top; right: rightBit.left}
    }
    Image {
        id: rightBit
        source: "meegotouch-keyboard-function-key-right.png"
        anchors { top: parent.top; right: parent.right }
    }


    MouseArea {
        id: mouse_area
        anchors.fill: parent
        onClicked: { clickedPass() }
        onPressed: aFunctKey.opacity = 0.6
        onCanceled: aFunctKey.opacity = 1
        onReleased: { parent.released(); aFunctKey.opacity = 1 }
        onPressAndHold: { pressedAndHoldPass() }
    }

    Image {
        anchors.centerIn: parent
        source: icon
    }

    Text {
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "sans"
        font.pixelSize: UI.fontSize
        font.bold: true
        color: UI.fontColor
        text: caption
    }
}
