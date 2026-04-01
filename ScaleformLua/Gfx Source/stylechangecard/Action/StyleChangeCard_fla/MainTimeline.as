package StyleChangeCard_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var PetTypeImage:PetStyleCard;
        public var btnOk:Button;
        public var btnCancel:Button;
        public var labelStyleName:Label;
        public var btnPrev:Button;
        public var btnNext:Button;
        public var faceWoman:MovieClip;
        public var hairWoman:MovieClip;
        public var faceMan:MovieClip;
        public var hairMan:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnPrev_Scene1_button_0();
            this.__setProp_btnOk_Scene1_button_0();
            this.__setProp_btnCancel_Scene1_button_0();
            this.__setProp_btnNext_Scene1_button_0();
            this.__setProp_labelStyleName_Scene1_button_0();
            return;
        }// end function

        function __setProp_btnPrev_Scene1_button_0()
        {
            try
            {
                this.btnPrev["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnPrev.autoRepeat = false;
            this.btnPrev.autoSize = "none";
            this.btnPrev.enabled = true;
            this.btnPrev.focusable = false;
            this.btnPrev.groupName = "";
            this.btnPrev.label = "";
            this.btnPrev.overlayAlign = "none";
            this.btnPrev.overlayImg = "";
            this.btnPrev.overlayPadding = {x:0, y:0};
            this.btnPrev.preventAutoSize = false;
            this.btnPrev.selected = false;
            this.btnPrev.toggle = false;
            this.btnPrev.visible = true;
            try
            {
                this.btnPrev["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
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

        function __setProp_btnNext_Scene1_button_0()
        {
            try
            {
                this.btnNext["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnNext.autoRepeat = false;
            this.btnNext.autoSize = "none";
            this.btnNext.enabled = true;
            this.btnNext.focusable = false;
            this.btnNext.groupName = "";
            this.btnNext.label = "";
            this.btnNext.overlayAlign = "none";
            this.btnNext.overlayImg = "";
            this.btnNext.overlayPadding = {x:0, y:0};
            this.btnNext.preventAutoSize = false;
            this.btnNext.selected = false;
            this.btnNext.toggle = false;
            this.btnNext.visible = true;
            try
            {
                this.btnNext["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelStyleName_Scene1_button_0()
        {
            try
            {
                this.labelStyleName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelStyleName.autoSize = "center";
            this.labelStyleName.autoSizeEnable = false;
            this.labelStyleName.enabled = true;
            this.labelStyleName.text = "";
            this.labelStyleName.visible = true;
            try
            {
                this.labelStyleName["componentInspectorSetting"] = false;
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
