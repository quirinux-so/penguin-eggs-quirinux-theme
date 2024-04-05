/* === This file is part of Calamares - <http://github.com/calamares> ===
 *
 *   Copyright 2015, Teo Mrnjavac <teo@kde.org>
 *   Copyright 2018, Jonathan Carter <jcc@debian.org>
 *
 *   Calamares is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, or (at your option) any later version.
 *
 *   Calamares is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
 */


// https://github.com/calamares/calamares-extensions


import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
        console.log("QML Component (default slideshow) Next slide");
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 7500
        running: true
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {
        Image {
            id: slide1
            source: "slide1.png"
            anchors.centerIn: parent
            anchors.top: background.bottom
            width: 810
            height: 485
            fillMode: Image.PreserveAspectFit
        }
         Text {
            font.family: "Helvetica"
            font.pixelSize : 12
            color: "#1a1a1a"
            anchors.horizontalCenter: slide1.horizontalCenter
            anchors.top: background.top
            text: qsTr("<h1>Quirinux General 64 Ver.2.0</h1>" +
                  "<h2>Basado en Debian GNU/Linux</h2>" +
                  "<h3>https://www.quirinux.org/</h3>" +
                  "<br/>" +
                  "Logotipo de: Thomas Gaya.<br/>Sistema de creación de ISO: Penguins' Eggs, de Piero Proietti.</p><br/>Voluntarios beta-testers: Martín Figuera, Facundo Redoni (AnimaTics), Noelia Gerbaudo, Leonardo Besingor y Sela González.<br/><br/> Gracias totales a Javier Obregón, Pablo López (Etertics),<br/>Gustav González (Tupi),<br/>Gustavo Deveze, Patricia Mengui,<br/>Riky Linux, Ernesto Bazzano, jeremybullock, manongjohn (Tahoma2D) y Geri Ratclife.<br/><br/>"+
                "Hecho en Buenos Aires (Argentina),<br/>Santiago de Compostela (Galicia, España) y Roma (Italia).</br>")
            wrapMode: Text.WordWrap
            width: kde.width
            horizontalAlignment: Text.Center
        }
    }

    // When this slideshow is loaded as a V1 slideshow, only
    // activatedInCalamares is set, which starts the timer (see above).
    //
    // In V2, also the onActivate() and onLeave() methods are called.
    // These example functions log a message (and re-start the slides
    // from the first).
    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }

    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }
}

