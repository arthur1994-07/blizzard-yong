package GenderChangeCard_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var btnOk:Button;
        public var btnCancel:Button;
        public var labelHair:Label;
        public var labelFace:Label;
        public var btnHairPrev:Button;
        public var btnHairNext:Button;
        public var btnFacePrev:Button;
        public var btnFaceNext:Button;
        public var faceWoman:MovieClip;
        public var hairWoman:MovieClip;
        public var faceMan:MovieClip;
        public var hairMan:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnOk_Scene1_button_0();
            this.__setProp_btnCancel_Scene1_button_0();
            this.__setProp_btnHairNext_Scene1_button_0();
            this.__setProp_btnHairPrev_Scene1_button_0();
            this.__setProp_btnFaceNext_Scene1_button_0();
            this.__setProp_btnFacePrev_Scene1_button_0();
            this.__setProp_labelHair_Scene1_button_0();
            this.__setProp_labelFace_Scene1_button_0();
            return;
        }// end function

        function __setProp_btnOk_Scene1_button_0()
        {
            try
            {
                this.btnOk["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOk.autoRepeat = false;
            this.btnOk.autoSize = "none";
            this.btnOk.enabled = true;
            this.btnOk.focusable = false;
            this.btnOk.groupName = "";
            this.btnOk.label = "";
            this.btnOk.overlayAlign = "none";
            this.btnOk.overlayImg = "";
            this.btnOk.overlayPadding = {x:0, y:0};
            this.btnOk.preventAutoSize = false;
            this.btnOk.selected = false;
            this.btnOk.toggle = false;
            this.btnOk.visible = true;
            try
            {
                this.btnOk["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCancel_Scene1_button_0()
        {
            try
            {
                this.btnCancel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCancel.autoRepeat = false;
            this.btnCancel.autoSize = "none";
            this.btnCancel.enabled = true;
            this.btnCancel.focusable = false;
            this.btnCancel.groupName = "";
            this.btnCancel.label = "";
            this.btnCancel.overlayAlign = "none";
            this.btnCancel.overlayImg = "";
            this.btnCancel.overlayPadding = {x:0, y:0};
            this.btnCancel.preventAutoSize = false;
            this.btnCancel.selected = false;
            this.btnCancel.toggle = false;
            this.btnCancel.visible = true;
            try
            {
                this.btnCancel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHairNext_Scene1_button_0()
        {
            try
            {
                this.btnHairNext["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHairNext.autoRepeat = false;
            this.btnHairNext.autoSize = "none";
            this.btnHairNext.enabled = true;
            this.btnHairNext.focusable = false;
            this.btnHairNext.groupName = "";
            this.btnHairNext.label = "";
            this.btnHairNext.overlayAlign = "none";
            this.btnHairNext.overlayImg = "";
            this.btnHairNext.overlayPadding = {x:0, y:0};
            this.btnHairNext.preventAutoSize = false;
            this.btnHairNext.selected = false;
            this.btnHairNext.toggle = false;
            this.btnHairNext.visible = true;
            try
            {
                this.btnHairNext["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHairPrev_Scene1_button_0()
        {
            try
            {
                this.btnHairPrev["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHairPrev.autoRepeat = false;
            this.btnHairPrev.autoSize = "none";
            this.btnHairPrev.enabled = true;
            this.btnHairPrev.focusable = false;
            this.btnHairPrev.groupName = "";
            this.btnHairPrev.label = "";
            this.btnHairPrev.overlayAlign = "none";
            this.btnHairPrev.overlayImg = "";
            this.btnHairPrev.overlayPadding = {x:0, y:0};
            this.btnHairPrev.preventAutoSize = false;
            this.btnHairPrev.selected = false;
            this.btnHairPrev.toggle = false;
            this.btnHairPrev.visible = true;
            try
            {
                this.btnHairPrev["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFaceNext_Scene1_button_0()
        {
            try
            {
                this.btnFaceNext["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFaceNext.autoRepeat = false;
            this.btnFaceNext.autoSize = "none";
            this.btnFaceNext.enabled = true;
            this.btnFaceNext.focusable = false;
            this.btnFaceNext.groupName = "";
            this.btnFaceNext.label = "";
            this.btnFaceNext.overlayAlign = "none";
            this.btnFaceNext.overlayImg = "";
            this.btnFaceNext.overlayPadding = {x:0, y:0};
            this.btnFaceNext.preventAutoSize = false;
            this.btnFaceNext.selected = false;
            this.btnFaceNext.toggle = false;
            this.btnFaceNext.visible = true;
            try
            {
                this.btnFaceNext["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFacePrev_Scene1_button_0()
        {
            try
            {
                this.btnFacePrev["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFacePrev.autoRepeat = false;
            this.btnFacePrev.autoSize = "none";
            this.btnFacePrev.enabled = true;
            this.btnFacePrev.focusable = false;
            this.btnFacePrev.groupName = "";
            this.btnFacePrev.label = "";
            this.btnFacePrev.overlayAlign = "none";
            this.btnFacePrev.overlayImg = "";
            this.btnFacePrev.overlayPadding = {x:0, y:0};
            this.btnFacePrev.preventAutoSize = false;
            this.btnFacePrev.selected = false;
            this.btnFacePrev.toggle = false;
            this.btnFacePrev.visible = true;
            try
            {
                this.btnFacePrev["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelHair_Scene1_button_0()
        {
            try
            {
                this.labelHair["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelHair.autoSize = "center";
            this.labelHair.autoSizeEnable = false;
            this.labelHair.enabled = true;
            this.labelHair.text = "";
            this.labelHair.visible = true;
            try
            {
                this.labelHair["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelFace_Scene1_button_0()
        {
            try
            {
                this.labelFace["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelFace.autoSize = "center";
            this.labelFace.autoSizeEnable = false;
            this.labelFace.enabled = true;
            this.labelFace.text = "";
            this.labelFace.visible = true;
            try
            {
                this.labelFace["componentInspectorSetting"] = false;
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
