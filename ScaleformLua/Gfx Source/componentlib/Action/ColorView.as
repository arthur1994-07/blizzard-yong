package 
{
    import ran.ui.core.*;

    dynamic public class ColorView extends MColorView
    {

        public function ColorView()
        {
            addFrameScript(9, this.frame10, 19, this.frame20);
            this.__setProp_btnColor_ColorView_color_0();
            return;
        }// end function

        function __setProp_btnColor_ColorView_color_0()
        {
            try
            {
                btnColor["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            btnColor.autoRepeat = false;
            btnColor.autoSize = "none";
            btnColor.enabled = true;
            btnColor.focusable = false;
            btnColor.groupName = "";
            btnColor.label = "";
            btnColor.overlayAlign = "none";
            btnColor.overlayImg = "";
            btnColor.overlayPadding = {x:0, y:0};
            btnColor.selected = false;
            btnColor.toggle = false;
            btnColor.visible = true;
            try
            {
                btnColor["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

    }
}
