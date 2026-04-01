package Minimap_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var victoryIconInfo:MovieClip;
        public var btn_img:MovieClip;
        public var labelChannel:Label;
        public var labelName:Label;
        public var labelPos:Label;
        public var labelDate:Label;
        public var labelDateFold:Label;
        public var labelPosFold:Label;
        public var btnCurrent:Button;
        public var btnFullScreen:Button;
        public var btnScaleUp:Button;
        public var btnScaleDown:Button;
        public var btnFold:Button;
        public var btnUnFold:Button;
        public var map:MMap;
        public var bgFold:MovieClip;
        public var bg:MovieClip;
        public var bgMap:MovieClip;
        public var mcCountryImg:UIComponent;
        public var mcSecretMap:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnUnFold_Scene1_MiniLabel_0();
            this.__setProp_labelPosFold_Scene1_MiniLabel_0();
            this.__setProp_btnScaleUp_Scene1_btn_0();
            this.__setProp_btnScaleDown_Scene1_btn_0();
            this.__setProp_btnFold_Scene1_btn_0();
            this.__setProp_labelPos_Scene1_label_0();
            return;
        }// end function

        function __setProp_btnUnFold_Scene1_MiniLabel_0()
        {
            try
            {
                this.btnUnFold["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnUnFold.autoRepeat = false;
            this.btnUnFold.autoSize = "center";
            this.btnUnFold.enabled = true;
            this.btnUnFold.focusable = false;
            this.btnUnFold.groupName = "";
            this.btnUnFold.label = " M";
            this.btnUnFold.overlayAlign = "none";
            this.btnUnFold.overlayImg = "";
            this.btnUnFold.overlayPadding = {x:0, y:0};
            this.btnUnFold.preventAutoSize = true;
            this.btnUnFold.selected = false;
            this.btnUnFold.toggle = false;
            this.btnUnFold.visible = true;
            try
            {
                this.btnUnFold["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPosFold_Scene1_MiniLabel_0()
        {
            try
            {
                this.labelPosFold["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPosFold.autoSize = "right";
            this.labelPosFold.enabled = true;
            this.labelPosFold.text = "";
            this.labelPosFold.visible = true;
            try
            {
                this.labelPosFold["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnScaleUp_Scene1_btn_0()
        {
            try
            {
                this.btnScaleUp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnScaleUp.autoRepeat = false;
            this.btnScaleUp.autoSize = "none";
            this.btnScaleUp.enabled = true;
            this.btnScaleUp.focusable = false;
            this.btnScaleUp.groupName = "";
            this.btnScaleUp.label = "+";
            this.btnScaleUp.overlayAlign = "none";
            this.btnScaleUp.overlayImg = "";
            this.btnScaleUp.overlayPadding = {x:0, y:0};
            this.btnScaleUp.preventAutoSize = true;
            this.btnScaleUp.selected = false;
            this.btnScaleUp.toggle = false;
            this.btnScaleUp.visible = true;
            try
            {
                this.btnScaleUp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnScaleDown_Scene1_btn_0()
        {
            try
            {
                this.btnScaleDown["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnScaleDown.autoRepeat = false;
            this.btnScaleDown.autoSize = "none";
            this.btnScaleDown.enabled = true;
            this.btnScaleDown.focusable = false;
            this.btnScaleDown.groupName = "";
            this.btnScaleDown.label = "-";
            this.btnScaleDown.overlayAlign = "none";
            this.btnScaleDown.overlayImg = "";
            this.btnScaleDown.overlayPadding = {x:0, y:0};
            this.btnScaleDown.preventAutoSize = true;
            this.btnScaleDown.selected = false;
            this.btnScaleDown.toggle = false;
            this.btnScaleDown.visible = true;
            try
            {
                this.btnScaleDown["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFold_Scene1_btn_0()
        {
            try
            {
                this.btnFold["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFold.autoRepeat = false;
            this.btnFold.autoSize = "center";
            this.btnFold.enabled = true;
            this.btnFold.focusable = false;
            this.btnFold.groupName = "";
            this.btnFold.label = " M";
            this.btnFold.overlayAlign = "none";
            this.btnFold.overlayImg = "";
            this.btnFold.overlayPadding = {x:0, y:0};
            this.btnFold.preventAutoSize = true;
            this.btnFold.selected = false;
            this.btnFold.toggle = false;
            this.btnFold.visible = true;
            try
            {
                this.btnFold["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPos_Scene1_label_0()
        {
            try
            {
                this.labelPos["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPos.autoSize = "right";
            this.labelPos.enabled = true;
            this.labelPos.text = "";
            this.labelPos.visible = true;
            try
            {
                this.labelPos["componentInspectorSetting"] = false;
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
