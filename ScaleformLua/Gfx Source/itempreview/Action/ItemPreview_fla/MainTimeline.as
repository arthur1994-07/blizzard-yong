package ItemPreview_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var Preview:PreviewRenderTexture;
        public var TruunRight:DefaultButton_rotate_L;
        public var TurnLeft:DefaultButton_rotate_R;
        public var textHat:Label;
        public var textTop:Label;
        public var textBottom:Label;
        public var textGloves:Label;
        public var textShoes:Label;
        public var textWeapon:Label;
        public var slotHat:Slot;
        public var slotTop:Slot;
        public var slotBottom:Slot;
        public var slotGloves:Slot;
        public var slotShoes:Slot;
        public var slotWeapon:Slot;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_TurnLeft_Scene1_button_0();
            this.__setProp_TruunRight_Scene1_button_0();
            return;
        }// end function

        function __setProp_TurnLeft_Scene1_button_0()
        {
            try
            {
                this.TurnLeft["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TurnLeft.autoRepeat = false;
            this.TurnLeft.autoSize = "none";
            this.TurnLeft.enabled = true;
            this.TurnLeft.focusable = false;
            this.TurnLeft.groupName = "";
            this.TurnLeft.label = "";
            this.TurnLeft.overlayAlign = "none";
            this.TurnLeft.overlayImg = "";
            this.TurnLeft.overlayPadding = {x:0, y:0};
            this.TurnLeft.preventAutoSize = false;
            this.TurnLeft.selected = false;
            this.TurnLeft.toggle = false;
            this.TurnLeft.visible = true;
            try
            {
                this.TurnLeft["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TruunRight_Scene1_button_0()
        {
            try
            {
                this.TruunRight["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TruunRight.autoRepeat = false;
            this.TruunRight.autoSize = "none";
            this.TruunRight.enabled = true;
            this.TruunRight.focusable = false;
            this.TruunRight.groupName = "";
            this.TruunRight.label = "";
            this.TruunRight.overlayAlign = "none";
            this.TruunRight.overlayImg = "";
            this.TruunRight.overlayPadding = {x:0, y:0};
            this.TruunRight.preventAutoSize = false;
            this.TruunRight.selected = false;
            this.TruunRight.toggle = false;
            this.TruunRight.visible = true;
            try
            {
                this.TruunRight["componentInspectorSetting"] = false;
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
