package MessageBox_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class msgBoxOK_2 extends MovieClip
    {
        public var btnOK:Button;

        public function msgBoxOK_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnOK_msgBoxOK_MsgBox_0();
            return;
        }// end function

        function __setProp_btnOK_msgBoxOK_MsgBox_0()
        {
            try
            {
                this.btnOK["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOK.autoRepeat = false;
            this.btnOK.autoSize = "none";
            this.btnOK.enabled = true;
            this.btnOK.focusable = false;
            this.btnOK.groupName = "";
            this.btnOK.label = "";
            this.btnOK.overlayAlign = "none";
            this.btnOK.overlayImg = "";
            this.btnOK.overlayPadding = {x:0, y:0};
            this.btnOK.preventAutoSize = false;
            this.btnOK.selected = false;
            this.btnOK.toggle = false;
            this.btnOK.visible = true;
            try
            {
                this.btnOK["componentInspectorSetting"] = false;
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
