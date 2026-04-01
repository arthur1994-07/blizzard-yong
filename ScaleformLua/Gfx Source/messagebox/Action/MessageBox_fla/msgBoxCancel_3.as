package MessageBox_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class msgBoxCancel_3 extends MovieClip
    {
        public var btnCancel:Button;

        public function msgBoxCancel_3()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnCancel_msgBoxCancel_MsgBox_0();
            return;
        }// end function

        function __setProp_btnCancel_msgBoxCancel_MsgBox_0()
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

        function frame1()
        {
            return;
        }// end function

    }
}
