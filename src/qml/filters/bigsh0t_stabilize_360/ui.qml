
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import Shotcut.Controls 1.0 as Shotcut

Item {
    width: 350
    height: 625
    property bool blockUpdate: true

    property int interpolationValue : 0;
    property bool analyzeValue : false;
    property bool transformWhenAnalyzingValue: false;
    property double sampleRadiusValue : 0.0;
    property double searchRadiusValue : 0.0;
    property double offsetValue : 0.0;
    property string analysisFileValue : "";
    property bool useBackTrackpointsValue : false;
    property double stabilizeYawValue : 0.0;
    property double stabilizePitchValue : 0.0;
    property double stabilizeRollValue : 0.0;
    property double smoothYawValue : 0.0;
    property double smoothPitchValue : 0.0;
    property double smoothRollValue : 0.0;
    property double timeBiasYawValue : 0.0;
    property double timeBiasPitchValue : 0.0;
    property double timeBiasRollValue : 0.0;
    property double clipOffsetValue: 0.0;

    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_interpolation (); } onOutChanged: { updateProperty_interpolation (); } onAnimateInChanged: { updateProperty_interpolation (); } onAnimateOutChanged: { updateProperty_interpolation (); } }
    Connections { target: filter; onChanged: setControls(); }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_sampleRadius (null); } onOutChanged: { updateProperty_sampleRadius (null); } onAnimateInChanged: { updateProperty_sampleRadius (null); } onAnimateOutChanged: { updateProperty_sampleRadius (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_searchRadius (null); } onOutChanged: { updateProperty_searchRadius (null); } onAnimateInChanged: { updateProperty_searchRadius (null); } onAnimateOutChanged: { updateProperty_searchRadius (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_offset (null); } onOutChanged: { updateProperty_offset (null); } onAnimateInChanged: { updateProperty_offset (null); } onAnimateOutChanged: { updateProperty_offset (null); } }
    Connections { target: filter; onChanged: setControls(); }
    Connections { target: filter; onChanged: setControls(); }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_stabilizeYaw (null); } onOutChanged: { updateProperty_stabilizeYaw (null); } onAnimateInChanged: { updateProperty_stabilizeYaw (null); } onAnimateOutChanged: { updateProperty_stabilizeYaw (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_stabilizePitch (null); } onOutChanged: { updateProperty_stabilizePitch (null); } onAnimateInChanged: { updateProperty_stabilizePitch (null); } onAnimateOutChanged: { updateProperty_stabilizePitch (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_stabilizeRoll (null); } onOutChanged: { updateProperty_stabilizeRoll (null); } onAnimateInChanged: { updateProperty_stabilizeRoll (null); } onAnimateOutChanged: { updateProperty_stabilizeRoll (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_smoothYaw (null); } onOutChanged: { updateProperty_smoothYaw (null); } onAnimateInChanged: { updateProperty_smoothYaw (null); } onAnimateOutChanged: { updateProperty_smoothYaw (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_smoothPitch (null); } onOutChanged: { updateProperty_smoothPitch (null); } onAnimateInChanged: { updateProperty_smoothPitch (null); } onAnimateOutChanged: { updateProperty_smoothPitch (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_smoothRoll (null); } onOutChanged: { updateProperty_smoothRoll (null); } onAnimateInChanged: { updateProperty_smoothRoll (null); } onAnimateOutChanged: { updateProperty_smoothRoll (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_timeBiasYaw (null); } onOutChanged: { updateProperty_timeBiasYaw (null); } onAnimateInChanged: { updateProperty_timeBiasYaw (null); } onAnimateOutChanged: { updateProperty_timeBiasYaw (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_timeBiasPitch (null); } onOutChanged: { updateProperty_timeBiasPitch (null); } onAnimateInChanged: { updateProperty_timeBiasPitch (null); } onAnimateOutChanged: { updateProperty_timeBiasPitch (null); } }
    Connections { target: filter; onChanged: setControls(); onInChanged: { updateProperty_timeBiasRoll (null); } onOutChanged: { updateProperty_timeBiasRoll (null); } onAnimateInChanged: { updateProperty_timeBiasRoll (null); } onAnimateOutChanged: { updateProperty_timeBiasRoll (null); } }

    Component.onCompleted: {
        if (filter.isNew) { filter.set("analyze", false); } else { analyzeValue = filter.get("analyze"); }
        if (filter.isNew) { filter.set("transformWhenAnalyzing", true); } else { transformWhenAnalyzingValue = filter.get("transformWhenAnalyzing"); }
        if (filter.isNew) { filter.set("interpolation", 1); } else { interpolationValue = filter.get("interpolation"); }
        if (filter.isNew) { filter.set("sampleRadius", 16); } else { sampleRadiusValue = filter.getDouble("sampleRadius");}
        if (filter.isNew) { filter.set("searchRadius", 24); } else { searchRadiusValue = filter.getDouble("searchRadius");}
        if (filter.isNew) { filter.set("offset", 64); } else { offsetValue = filter.getDouble("offset");}
        if (filter.isNew) { filter.set("analysisFile", ""); } else { analysisFileValue = filter.get("analysisFile"); }
        if (filter.isNew) { filter.set("useBackTrackpoints", false); } else { useBackTrackpointsValue = filter.get("useBackTrackpoints"); }

        if (filter.isNew) { filter.set("stabilizeYaw", 100); } else { stabilizeYawValue = filter.getDouble("stabilizeYaw");}
        if (filter.isNew) { filter.set("stabilizePitch", 100); } else { stabilizePitchValue = filter.getDouble("stabilizePitch");}
        if (filter.isNew) { filter.set("stabilizeRoll", 100); } else { stabilizeRollValue = filter.getDouble("stabilizeRoll");}
        if (filter.isNew) { filter.set("smoothYaw", 120); } else { smoothYawValue = filter.getDouble("smoothYaw");}
        if (filter.isNew) { filter.set("smoothPitch", 120); } else { smoothPitchValue = filter.getDouble("smoothPitch");}
        if (filter.isNew) { filter.set("smoothRoll", 120); } else { smoothRollValue = filter.getDouble("smoothRoll");}
        if (filter.isNew) { filter.set("timeBiasYaw", 0); } else { timeBiasYawValue = filter.getDouble("timeBiasYaw");}
        if (filter.isNew) { filter.set("timeBiasPitch", 0); } else { timeBiasPitchValue = filter.getDouble("timeBiasPitch");}
        if (filter.isNew) { filter.set("timeBiasRoll", 0); } else { timeBiasRollValue = filter.getDouble("timeBiasRoll");}
        if (filter.isNew) { filter.set("clipOffset", 0); } else { clipOffsetValue = filter.getDouble("clipOffset");}

        if (filter.isNew) {
            filter.savePreset(preset.parameters)
        }
        setControls()
    }

    function setControls() {
        var position = getPosition()
        blockUpdate = true
        analyzeCheckBox.checked = filter.get("analyze") == '1';
        transformWhenAnalyzingCheckBox.checked = filter.get("transformWhenAnalyzing") == '1';
        interpolationComboBox.currentIndex = filter.get("interpolation")
        sampleRadiusSlider.value = filter.getDouble("sampleRadius")
        searchRadiusSlider.value = filter.getDouble("searchRadius")
        offsetSlider.value = filter.getDouble("offset")
        analysisFileTextField.text = filter.get("analysisFile")
        useBackTrackpointsCheckBox.checked = filter.get("useBackTrackpoints") == '1';
        stabilizeYawSlider.value = filter.getDouble("stabilizeYaw")
        stabilizePitchSlider.value = filter.getDouble("stabilizePitch")
        stabilizeRollSlider.value = filter.getDouble("stabilizeRoll")
        smoothYawSlider.value = filter.getDouble("smoothYaw")
        smoothPitchSlider.value = filter.getDouble("smoothPitch")
        smoothRollSlider.value = filter.getDouble("smoothRoll")
        timeBiasYawSlider.value = filter.getDouble("timeBiasYaw")
        timeBiasPitchSlider.value = filter.getDouble("timeBiasPitch")
        timeBiasRollSlider.value = filter.getDouble("timeBiasRoll")
        clipOffsetTextField.text = filter.getDouble("clipOffset").toFixed(4)

        blockUpdate = false
    }

    function updateProperty_analyze () { if (blockUpdate) return; var value = analyzeCheckBox.checked; filter.set("analyze", value); }
    function updateProperty_transformWhenAnalyzing() { if (blockUpdate) return; var value = transformWhenAnalyzingCheckBox.checked; filter.set("transformWhenAnalyzing", value); }
    function updateProperty_interpolation () { if (blockUpdate) return; var value = interpolationComboBox.currentIndex; filter.set("interpolation", value); }
    function updateProperty_sampleRadius (position) { if (blockUpdate) return; var value = sampleRadiusSlider.value; filter.set("sampleRadius", value); }
    function updateProperty_searchRadius (position) { if (blockUpdate) return; var value = searchRadiusSlider.value; filter.set("searchRadius", value); }
    function updateProperty_offset (position) { if (blockUpdate) return; var value = offsetSlider.value; filter.set("offset", value); }
    function updateProperty_analysisFile () { if (blockUpdate) return; var value = analysisFileTextField.text; filter.set("analysisFile", value); }
    function updateProperty_useBackTrackpoints () { if (blockUpdate) return; var value = useBackTrackpointsCheckBox.checked; filter.set("useBackTrackpoints", value); }
    function updateProperty_stabilizeYaw (position) { if (blockUpdate) return; var value = stabilizeYawSlider.value; filter.set("stabilizeYaw", value); }
    function updateProperty_stabilizePitch (position) { if (blockUpdate) return; var value = stabilizePitchSlider.value; filter.set("stabilizePitch", value); }
    function updateProperty_stabilizeRoll (position) { if (blockUpdate) return; var value = stabilizeRollSlider.value; filter.set("stabilizeRoll", value); }
    function updateProperty_smoothYaw (position) { if (blockUpdate) return; var value = smoothYawSlider.value; filter.set("smoothYaw", value); }
    function updateProperty_smoothPitch (position) { if (blockUpdate) return; var value = smoothPitchSlider.value; filter.set("smoothPitch", value); }
    function updateProperty_smoothRoll (position) { if (blockUpdate) return; var value = smoothRollSlider.value; filter.set("smoothRoll", value); }
    function updateProperty_timeBiasYaw (position) { if (blockUpdate) return; var value = timeBiasYawSlider.value; filter.set("timeBiasYaw", value); }
    function updateProperty_timeBiasPitch (position) { if (blockUpdate) return; var value = timeBiasPitchSlider.value; filter.set("timeBiasPitch", value); }
    function updateProperty_timeBiasRoll (position) { if (blockUpdate) return; var value = timeBiasRollSlider.value; filter.set("timeBiasRoll", value); }
    function updateProperty_clipOffset (position) { if (blockUpdate) return; var value = parseFloat(clipOffsetTextField.text); filter.set("clipOffset", value); }


    function getPosition() {
        return Math.max(producer.position - (filter.in - producer.in), 0)
    }

    function getFrameRate() {
        return producer.getDouble("meta.media.frame_rate_num", getPosition()) / producer.getDouble("meta.media.frame_rate_den", getPosition())
    }

    function getClipOffset() {
        return filter.in
    }

    FileDialog {
        id: selectAnalysisFile
        title: "File for motion analysis"
        folder: shortcuts.home
        modality: application.dialogModality
        selectMultiple: false
        selectExisting: false
        selectFolder: false
        nameFilters: ['Motion Analysis Files (*.bigsh0t360motion)', 'All Files (*)']

        onAccepted: {
            var urlString = selectAnalysisFile.fileUrl.toString()
            analysisFileTextField.text = urlString

            updateProperty_analysisFile()
        }
        onRejected: {
        }
    }

    function toggleMode() {
        if (blockUpdate) return;
        if (analyzeCheckBox.checked && analysisFileTextField.text == "") {
            selectAnalysisFile.open()
        }
        updateProperty_analyze()
    }

    function onClipOffsetUndo() {
        clipOffsetTextField.text = (getClipOffset() / getFrameRate()).toFixed(4)
        updateProperty_clipOffset()
    }


    GridLayout {
        columns: 4
        anchors.fill: parent
        anchors.margins: 8

        Label {
            text: qsTr('Preset')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.Preset {
            id: preset
            parameters: ["sampleRadius", "searchRadius", "offset", "interpolation", "stabilizeYaw", "stabilizePitch", "stabilizeRoll", "smoothYaw", "smoothPitch", "smoothRoll", "timeBiasYaw", "timeBiasPitch", "timeBiasRoll"]
            Layout.columnSpan: 3
            onBeforePresetLoaded: {
                filter.resetProperty("sampleRadius")
                filter.resetProperty("searchRadius")
                filter.resetProperty("offset")
                filter.resetProperty("interpolation")
                filter.resetProperty("stabilizeYaw")
                filter.resetProperty("stabilizePitch")
                filter.resetProperty("stabilizeRoll")
                filter.resetProperty("smoothYaw")
                filter.resetProperty("smoothPitch")
                filter.resetProperty("smoothRoll")
                filter.resetProperty("timeBiasYaw")
                filter.resetProperty("timeBiasPitch")
                filter.resetProperty("timeBiasRoll")
                filter.resetProperty("clipOffset")
            }
            onPresetSelected: {
                sampleRadiusValue = filter.getDouble("sampleRadius");
                searchRadiusValue = filter.getDouble("searchRadius");
                offsetValue = filter.getDouble("offset");
                interpolationValue = filter.get("interpolation");
                stabilizeYawValue = filter.getDouble("stabilizeYaw");
                stabilizePitchValue = filter.getDouble("stabilizePitch");
                stabilizeRollValue = filter.getDouble("stabilizeRoll");
                smoothYawValue = filter.getDouble("smoothYaw");
                smoothPitchValue = filter.getDouble("smoothPitch");
                smoothRollValue = filter.getDouble("smoothRoll");
                timeBiasYawValue = filter.getDouble("timeBiasYaw");
                timeBiasPitchValue = filter.getDouble("timeBiasPitch");
                timeBiasRollValue = filter.getDouble("timeBiasRoll");
                clipOffsetValue = filter.get("clipOffset");

                setControls(null);
            }
        }

        Label {
            text: qsTr('Mode')
            Layout.alignment: Qt.AlignRight
        }
        CheckBox {
            text: qsTr('Analyze')
            checked: false
            id: analyzeCheckBox
            Layout.columnSpan: 3
            onCheckedChanged: toggleMode()
        }

        Label {
            text: qsTr('File')
            Layout.alignment: Qt.AlignRight
        }
        TextField {
            text: qsTr("")
            id: analysisFileTextField
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft
            selectByMouse: true
            onEditingFinished: updateProperty_analysisFile()
        }
        Shotcut.Button {
            icon.name: 'document-open'
            icon.source: 'qrc:///icons/oxygen/32x32/actions/document-open.png'
            Shotcut.HoverTip { text: qsTr('Browse...') }
            implicitWidth: 20
            implicitHeight: 20
            onClicked: selectAnalysisFile.open()
        }

        Label {
            text: qsTr('Start Offset')
            Layout.alignment: Qt.AlignRight
        }
        TextField {
            id: clipOffsetTextField
            selectByMouse: true
            onEditingFinished: updateProperty_clipOffset()
        }
        Label {
            text: qsTr('seconds')
            Layout.fillWidth: true
        }
        Shotcut.UndoButton {
            id: clipOffsetUndo
            onClicked: onClipOffsetUndo()
        }

        Label {
            text: qsTr('Interpolation')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.ComboBox {
            currentIndex: 0
            model: ["Nearest-neighbor", "Bilinear"]
            id: interpolationComboBox
            Layout.columnSpan: 2
            onCurrentIndexChanged: updateProperty_interpolation()
        }
        Shotcut.UndoButton {
            id: interpolationUndo
            onClicked: interpolationComboBox.currentIndex = 0
        }


        Label {
            text: qsTr('Analysis')
            Layout.alignment: Qt.AlignLeft
            Layout.columnSpan: 4
        }

        Label {}
        CheckBox {
            text: qsTr('Apply transform')
            id: transformWhenAnalyzingCheckBox
            Layout.columnSpan: 3
            onCheckedChanged: updateProperty_transformWhenAnalyzing()
        }

        Label {
            text: qsTr('Sample Radius')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: sampleRadiusSlider
            minimumValue: 1
            maximumValue: 64
            suffix: ' px'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_sampleRadius(getPosition())
        }
        Shotcut.UndoButton {
            id: sampleRadiusUndo
            onClicked: sampleRadiusSlider.value = 16
        }

        Label {
            text: qsTr('Search Radius')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: searchRadiusSlider
            minimumValue: 1
            maximumValue: 128
            suffix: ' px'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_searchRadius(getPosition())
        }
        Shotcut.UndoButton {
            id: searchRadiusUndo
            onClicked: searchRadiusSlider.value = 24
        }

        Label {
            text: qsTr('Offset')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: offsetSlider
            minimumValue: 1
            maximumValue: 256
            suffix: ' px'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_offset(getPosition())
        }
        Shotcut.UndoButton {
            id: offsetUndo
            onClicked: offsetSlider.value = 64
        }

        Label {
            text: qsTr('Track Points')
            Layout.alignment: Qt.AlignRight
        }
        CheckBox {
            text: qsTr('Use backwards-facing track points')
            checked: false
            id: useBackTrackpointsCheckBox
            Layout.columnSpan: 3
            onCheckedChanged: updateProperty_useBackTrackpoints()
        }


        Label {
            text: qsTr('Yaw')
            Layout.alignment: Qt.AlignLeft
            Layout.columnSpan: 4
        }

        Label {
            text: qsTr('Amount')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: stabilizeYawSlider
            minimumValue: 0
            maximumValue: 100
            suffix: ' %'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_stabilizeYaw(getPosition())
        }
        Shotcut.UndoButton {
            id: stabilizeYawUndo
            onClicked: stabilizeYawSlider.value = 100
        }
        Label {
            text: qsTr('Smoothing')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: smoothYawSlider
            minimumValue: 1
            maximumValue: 300
            suffix: ' frames'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_smoothYaw(getPosition())
        }
        Shotcut.UndoButton {
            id: smoothYawUndo
            onClicked: smoothYawSlider.value = 120
        }
        Label {
            text: qsTr('Time Bias')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: timeBiasYawSlider
            minimumValue: -100
            maximumValue: 100
            suffix: ' %'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_timeBiasYaw(getPosition())
        }
        Shotcut.UndoButton {
            id: timeBiasYawUndo
            onClicked: timeBiasYawSlider.value = 0
        }

        Label {
            text: qsTr('Pitch', 'rotation around the side-to-side axis (roll, pitch, yaw)')
            Layout.alignment: Qt.AlignLeft
            Layout.columnSpan: 4
        }
        Label {
            text: qsTr('Amount')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: stabilizePitchSlider
            minimumValue: 0
            maximumValue: 100
            suffix: ' %'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_stabilizePitch(getPosition())
        }
        Shotcut.UndoButton {
            id: stabilizePitchUndo
            onClicked: stabilizePitchSlider.value = 100
        }
        Label {
            text: qsTr('Smoothing')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: smoothPitchSlider
            minimumValue: 1
            maximumValue: 300
            suffix: ' frames'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_smoothPitch(getPosition())
        }
        Shotcut.UndoButton {
            id: smoothPitchUndo
            onClicked: smoothPitchSlider.value = 120
        }
        Label {
            text: qsTr('Time Bias')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: timeBiasPitchSlider
            minimumValue: -100
            maximumValue: 100
            suffix: ' %'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_timeBiasPitch(getPosition())
        }
        Shotcut.UndoButton {
            id: timeBiasPitchUndo
            onClicked: timeBiasPitchSlider.value = 0
        }

        Label {
            text: qsTr('Roll')
            Layout.alignment: Qt.AlignLeft
            Layout.columnSpan: 4
        }
        Label {
            text: qsTr('Amount')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: stabilizeRollSlider
            minimumValue: 0
            maximumValue: 100
            suffix: ' %'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_stabilizeRoll(getPosition())
        }
        Shotcut.UndoButton {
            id: stabilizeRollUndo
            onClicked: stabilizeRollSlider.value = 100
        }
        Label {
            text: qsTr('Smoothing')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: smoothRollSlider
            minimumValue: 1
            maximumValue: 300
            suffix: ' frames'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_smoothRoll(getPosition())
        }
        Shotcut.UndoButton {
            id: smoothRollUndo
            onClicked: smoothRollSlider.value = 120
        }

        Label {
            text: qsTr('Time Bias')
            Layout.alignment: Qt.AlignRight
        }
        Shotcut.SliderSpinner {
            id: timeBiasRollSlider
            minimumValue: -100
            maximumValue: 100
            suffix: ' %'
            decimals: 0
            stepSize: 1
            Layout.columnSpan: 2
            onValueChanged: updateProperty_timeBiasRoll(getPosition())
        }
        Shotcut.UndoButton {
            id: timeBiasRollUndo
            onClicked: timeBiasRollSlider.value = 0
        }
        Item {
            Layout.fillHeight: true
        }
    }

    Connections {
        target: filter
        onPropertyChanged: setControls()
    }

    Connections {
        target: producer
        onPositionChanged: setControls()
    }
}
