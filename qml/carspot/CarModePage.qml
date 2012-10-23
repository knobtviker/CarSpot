/****************************************************************************
**
** Copyright (c) 2012 Troels Nilsson.
** All rights reserved.
** Contact: nilsson.troels@gmail.com
**
** This file is part of the CarSpot project.
** 
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions
** are met:
** 
** Redistributions of source code must retain the above copyright notice,
** this list of conditions and the following disclaimer.
** 
** Redistributions in binary form must reproduce the above copyright
** notice, this list of conditions and the following disclaimer in the
** documentation and/or other materials provided with the distribution.
** 
** Neither the name of CarSpot nor the names of its contributors may be
** used to endorse or promote products derived from this software without
** specific prior written permission.
** 
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
** FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
** TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
** PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
** LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
** NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
****************************************************************************/
import QtQuick 1.1
import com.nokia.meego 1.1     // MeeGo 1.2 Harmattan components

Page
{
    anchors.fill: parent

    orientationLock: PageOrientation.LockLandscape

    property bool disableBackButton: false

    signal backClicked

    // Add any children to the contentItem
    default property alias content: contentItem.data

    // Black background
    Rectangle
    {
        anchors.fill: parent
        color: "black"
    }

    // Home button
    SVGImageButton
    {
        id: home_btn

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: (parent.disableBackButton) ? parent.bottom : undefined
        width: Constants.NaviButtonWidth
        height: (parent.disableBackButton) ? undefined : parent.height/2

        icon: "SpotifyAssets.svg/iconHome"
        background: (parent.disableBackButton) ? "SpotifyAssets.svg/btnBgBack-normal" : "SpotifyAssets.svg/btnBgLeftTopSpotify-normal"

        onClicked: carmodeApp.showHomeScreen()
    }

    // Back button
    SVGImageButton
    {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: home_btn.bottom
        width: Constants.NaviButtonWidth

        icon: "SpotifyAssets.svg/iconBack"
        background: "SpotifyAssets.svg/btnBgLeftBottomSpotify-normal"

        onClicked: parent.backClicked()

        visible: (parent.disableBackButton) ? false : true
    }

    // Page contents go here
    Item
    {
        id: contentItem

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: home_btn.right
        anchors.right: parent.right
    }
}
