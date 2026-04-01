package GroupChat_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class Minimize_4 extends MovieClip
    {
        public var title:MovieClip;
        public var btnMaximize:Button;

        public function Minimize_4()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnMaximize_Minimize_btn_0();
            return;
        }// end function

        function __setProp_btnMaximize_Minimize_btn_0()
        {
            try
            {
                this.btnMaximize["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnMaximize.autoRepeat = false;
            this.btnMaximize.autoSize = "none";
            this.btnMaximize.enabled = true;
            this.btnMaximize.focusable = false;
            this.btnMaximize.groupName = "";
            this.btnMaximize.label = "";
            this.btnMaximize.overlayAlign = "none";
            this.btnMaximize.overlayImg = "";
            this.btnMaximize.overlayPadding = {x:0, y:0};
            this.btnMaximize.preventAutoSize = false;
            this.btnMaximize.selected = false;
            this.btnMaximize.toggle = false;
            this.btnMaximize.visible = true;
            try
            {
                this.btnMaximize["componentInspectorSetting"] = false;
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
