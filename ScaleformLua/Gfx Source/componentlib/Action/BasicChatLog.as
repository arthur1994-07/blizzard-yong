package 
{
    import ran.ui.core.*;

    dynamic public class BasicChatLog extends MChatLog
    {

        public function BasicChatLog()
        {
            this.__setProp_scrollBar_BasicChatLog_scrollBar_0();
            return;
        }// end function

        function __setProp_scrollBar_BasicChatLog_scrollBar_0()
        {
            try
            {
                scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            scrollBar.enabled = true;
            scrollBar.minThumbSize = 10;
            scrollBar.offsetBottom = 0;
            scrollBar.offsetTop = 0;
            scrollBar.scrollTarget = "textField";
            scrollBar.trackMode = "scrollPage";
            scrollBar.visible = true;
            try
            {
                scrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
