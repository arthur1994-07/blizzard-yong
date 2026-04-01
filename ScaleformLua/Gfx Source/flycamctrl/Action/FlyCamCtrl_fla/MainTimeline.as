package FlyCamCtrl_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var keyCfg:MovieClip;
        public var listKeyFrameRenderer1:ListItemRenderer;
        public var listKeyFrameRenderer2:ListItemRenderer;
        public var listKeyFrameRenderer3:ListItemRenderer;
        public var listKeyFrameRenderer4:ListItemRenderer;
        public var listKeyFrameRenderer5:ListItemRenderer;
        public var listKeyFrameRenderer6:ListItemRenderer;
        public var listKeyFrameRenderer7:ListItemRenderer;
        public var listKeyFrameRenderer8:ListItemRenderer;
        public var listKeyFrame:ScrollingList;
        public var labelCamMove:Label;
        public var labelCurPos:Label;
        public var labelCamRot:Label;
        public var FPS:Label;
        public var KEY:Label;
        public var TOTAL:Label;
        public var numCamMove:NumericStepper;
        public var numCamRot:NumericStepper;
        public var btnHelp:Button;
        public var inputFps:TextInput;
        public var inputKey:TextInput;
        public var inputTotal:TextInput;
        public var btnAdd:Button;
        public var btnDel:Button;
        public var btnPlay:Button;
        public var btnStop:Button;
        public var btnRewind:Button;
        public var barProg:StatusIndicator;
        public var listKeyFrame_ScrollBar:ScrollBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_barProg_Scene1_Layer3_0();
            this.__setProp_FPS_Scene1_Layer3_0();
            this.__setProp_inputFps_Scene1_Layer3_0();
            this.__setProp_KEY_Scene1_Layer3_0();
            this.__setProp_inputKey_Scene1_Layer3_0();
            this.__setProp_TOTAL_Scene1_Layer3_0();
            this.__setProp_inputTotal_Scene1_Layer3_0();
            this.__setProp_btnAdd_Scene1_Layer3_0();
            this.__setProp_btnDel_Scene1_Layer3_0();
            this.__setProp_btnPlay_Scene1_Layer3_0();
            this.__setProp_btnStop_Scene1_Layer3_0();
            this.__setProp_btnRewind_Scene1_Layer3_0();
            this.__setProp_listKeyFrame_Scene1_Layer2_0();
            this.__setProp_listKeyFrame_ScrollBar_Scene1_Layer2_0();
            this.__setProp_labelCamMove_Scene1_Layer1_0();
            this.__setProp_numCamMove_Scene1_Layer1_0();
            this.__setProp_btnHelp_Scene1_Layer1_0();
            this.__setProp_labelCamRot_Scene1_Layer1_0();
            this.__setProp_numCamRot_Scene1_Layer1_0();
            return;
        }// end function

        function __setProp_barProg_Scene1_Layer3_0()
        {
            try
            {
                this.barProg["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.barProg.enabled = true;
            this.barProg.maximum = 100;
            this.barProg.minimum = 0;
            this.barProg.value = 0;
            this.barProg.visible = true;
            try
            {
                this.barProg["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_FPS_Scene1_Layer3_0()
        {
            try
            {
                this.FPS["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.FPS.autoSize = "none";
            this.FPS.enabled = true;
            this.FPS.text = "FPS :";
            this.FPS.visible = true;
            try
            {
                this.FPS["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputFps_Scene1_Layer3_0()
        {
            try
            {
                this.inputFps["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputFps.defaultText = "";
            this.inputFps.displayAsPassword = false;
            this.inputFps.editable = true;
            this.inputFps.enabled = true;
            this.inputFps.focusable = true;
            this.inputFps.maxByte = 0;
            this.inputFps.maxChars = 0;
            this.inputFps.OnlyNumber = true;
            this.inputFps.Restrict = "all";
            this.inputFps.RestrictAddOn = "";
            this.inputFps.text = "";
            this.inputFps.visible = true;
            try
            {
                this.inputFps["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_KEY_Scene1_Layer3_0()
        {
            try
            {
                this.KEY["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.KEY.autoSize = "none";
            this.KEY.enabled = true;
            this.KEY.text = "KEY :";
            this.KEY.visible = true;
            try
            {
                this.KEY["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputKey_Scene1_Layer3_0()
        {
            try
            {
                this.inputKey["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputKey.defaultText = "";
            this.inputKey.displayAsPassword = false;
            this.inputKey.editable = true;
            this.inputKey.enabled = true;
            this.inputKey.focusable = true;
            this.inputKey.maxByte = 0;
            this.inputKey.maxChars = 0;
            this.inputKey.OnlyNumber = true;
            this.inputKey.Restrict = "all";
            this.inputKey.RestrictAddOn = "";
            this.inputKey.text = "";
            this.inputKey.visible = true;
            try
            {
                this.inputKey["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TOTAL_Scene1_Layer3_0()
        {
            try
            {
                this.TOTAL["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TOTAL.autoSize = "none";
            this.TOTAL.enabled = true;
            this.TOTAL.text = "TOTAL :";
            this.TOTAL.visible = true;
            try
            {
                this.TOTAL["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputTotal_Scene1_Layer3_0()
        {
            try
            {
                this.inputTotal["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputTotal.defaultText = "";
            this.inputTotal.displayAsPassword = false;
            this.inputTotal.editable = true;
            this.inputTotal.enabled = true;
            this.inputTotal.focusable = true;
            this.inputTotal.maxByte = 0;
            this.inputTotal.maxChars = 0;
            this.inputTotal.OnlyNumber = true;
            this.inputTotal.Restrict = "all";
            this.inputTotal.RestrictAddOn = "";
            this.inputTotal.text = "";
            this.inputTotal.visible = true;
            try
            {
                this.inputTotal["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnAdd_Scene1_Layer3_0()
        {
            try
            {
                this.btnAdd["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnAdd.autoRepeat = false;
            this.btnAdd.autoSize = "none";
            this.btnAdd.enabled = true;
            this.btnAdd.focusable = false;
            this.btnAdd.groupName = "";
            this.btnAdd.label = "Add";
            this.btnAdd.overlayAlign = "none";
            this.btnAdd.overlayImg = "";
            this.btnAdd.overlayPadding = {x:0, y:0};
            this.btnAdd.preventAutoSize = true;
            this.btnAdd.selected = false;
            this.btnAdd.toggle = false;
            this.btnAdd.visible = true;
            try
            {
                this.btnAdd["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDel_Scene1_Layer3_0()
        {
            try
            {
                this.btnDel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDel.autoRepeat = false;
            this.btnDel.autoSize = "none";
            this.btnDel.enabled = true;
            this.btnDel.focusable = false;
            this.btnDel.groupName = "";
            this.btnDel.label = "Del";
            this.btnDel.overlayAlign = "none";
            this.btnDel.overlayImg = "";
            this.btnDel.overlayPadding = {x:0, y:0};
            this.btnDel.preventAutoSize = true;
            this.btnDel.selected = false;
            this.btnDel.toggle = false;
            this.btnDel.visible = true;
            try
            {
                this.btnDel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnPlay_Scene1_Layer3_0()
        {
            try
            {
                this.btnPlay["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnPlay.autoRepeat = false;
            this.btnPlay.autoSize = "none";
            this.btnPlay.enabled = true;
            this.btnPlay.focusable = false;
            this.btnPlay.groupName = "";
            this.btnPlay.label = "Play";
            this.btnPlay.overlayAlign = "none";
            this.btnPlay.overlayImg = "";
            this.btnPlay.overlayPadding = {x:0, y:0};
            this.btnPlay.preventAutoSize = true;
            this.btnPlay.selected = false;
            this.btnPlay.toggle = false;
            this.btnPlay.visible = true;
            try
            {
                this.btnPlay["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnStop_Scene1_Layer3_0()
        {
            try
            {
                this.btnStop["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnStop.autoRepeat = false;
            this.btnStop.autoSize = "none";
            this.btnStop.enabled = true;
            this.btnStop.focusable = false;
            this.btnStop.groupName = "";
            this.btnStop.label = "Stop";
            this.btnStop.overlayAlign = "none";
            this.btnStop.overlayImg = "";
            this.btnStop.overlayPadding = {x:0, y:0};
            this.btnStop.preventAutoSize = true;
            this.btnStop.selected = false;
            this.btnStop.toggle = false;
            this.btnStop.visible = true;
            try
            {
                this.btnStop["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRewind_Scene1_Layer3_0()
        {
            try
            {
                this.btnRewind["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRewind.autoRepeat = false;
            this.btnRewind.autoSize = "none";
            this.btnRewind.enabled = true;
            this.btnRewind.focusable = false;
            this.btnRewind.groupName = "";
            this.btnRewind.label = "Rewind";
            this.btnRewind.overlayAlign = "none";
            this.btnRewind.overlayImg = "";
            this.btnRewind.overlayPadding = {x:0, y:0};
            this.btnRewind.preventAutoSize = true;
            this.btnRewind.selected = false;
            this.btnRewind.toggle = false;
            this.btnRewind.visible = true;
            try
            {
                this.btnRewind["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listKeyFrame_Scene1_Layer2_0()
        {
            try
            {
                this.listKeyFrame["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listKeyFrame.enabled = true;
            this.listKeyFrame.focusable = false;
            this.listKeyFrame.itemRendererName = "";
            this.listKeyFrame.itemRendererInstanceName = "listKeyFrameRenderer";
            this.listKeyFrame.margin = 0;
            this.listKeyFrame.multiSelect = false;
            this.listKeyFrame.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listKeyFrame.rowHeight = 0;
            this.listKeyFrame.scrollBar = "";
            this.listKeyFrame.treeButtonClassName = "";
            this.listKeyFrame.treeButtonGap = -1;
            this.listKeyFrame.treeCheckBoxClassName = "";
            this.listKeyFrame.treeList = false;
            this.listKeyFrame.visible = true;
            this.listKeyFrame.wrapping = "normal";
            try
            {
                this.listKeyFrame["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listKeyFrame_ScrollBar_Scene1_Layer2_0()
        {
            try
            {
                this.listKeyFrame_ScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listKeyFrame_ScrollBar.enabled = true;
            this.listKeyFrame_ScrollBar.minThumbSize = 10;
            this.listKeyFrame_ScrollBar.offsetBottom = 0;
            this.listKeyFrame_ScrollBar.offsetTop = 0;
            this.listKeyFrame_ScrollBar.scrollTarget = "listKeyFrame";
            this.listKeyFrame_ScrollBar.trackMode = "scrollPage";
            this.listKeyFrame_ScrollBar.visible = true;
            try
            {
                this.listKeyFrame_ScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCamMove_Scene1_Layer1_0()
        {
            try
            {
                this.labelCamMove["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCamMove.autoSize = "center";
            this.labelCamMove.enabled = true;
            this.labelCamMove.text = "";
            this.labelCamMove.visible = true;
            try
            {
                this.labelCamMove["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_numCamMove_Scene1_Layer1_0()
        {
            try
            {
                this.numCamMove["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.numCamMove.enabled = true;
            this.numCamMove.focusable = false;
            this.numCamMove.maximum = 9999;
            this.numCamMove.minimum = 0;
            this.numCamMove.stepSize = 1;
            this.numCamMove.value = 0;
            this.numCamMove.visible = true;
            try
            {
                this.numCamMove["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp_Scene1_Layer1_0()
        {
            try
            {
                this.btnHelp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp.autoRepeat = false;
            this.btnHelp.autoSize = "none";
            this.btnHelp.enabled = true;
            this.btnHelp.focusable = false;
            this.btnHelp.groupName = "";
            this.btnHelp.label = "?";
            this.btnHelp.overlayAlign = "none";
            this.btnHelp.overlayImg = "";
            this.btnHelp.overlayPadding = {x:0, y:0};
            this.btnHelp.preventAutoSize = false;
            this.btnHelp.selected = false;
            this.btnHelp.toggle = false;
            this.btnHelp.visible = true;
            try
            {
                this.btnHelp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCamRot_Scene1_Layer1_0()
        {
            try
            {
                this.labelCamRot["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCamRot.autoSize = "center";
            this.labelCamRot.enabled = true;
            this.labelCamRot.text = "";
            this.labelCamRot.visible = true;
            try
            {
                this.labelCamRot["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_numCamRot_Scene1_Layer1_0()
        {
            try
            {
                this.numCamRot["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.numCamRot.enabled = true;
            this.numCamRot.focusable = false;
            this.numCamRot.maximum = 9999;
            this.numCamRot.minimum = 0;
            this.numCamRot.stepSize = 1;
            this.numCamRot.value = 0;
            this.numCamRot.visible = true;
            try
            {
                this.numCamRot["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
