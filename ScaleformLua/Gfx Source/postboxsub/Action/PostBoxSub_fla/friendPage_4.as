package PostBoxSub_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class friendPage_4 extends MovieClip
    {
        public var friendList:MovieClip;
        public var okButton:Button;
        public var closeButton:Button;
        public var tabType:ButtonBar;

        public function friendPage_4()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_okButton_friendPage_tab_0();
            this.__setProp_closeButton_friendPage_tab_0();
            this.__setProp_tabType_friendPage_tab_0();
            return;
        }// end function

        function __setProp_okButton_friendPage_tab_0()
        {
            try
            {
                this.okButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.okButton.autoRepeat = false;
            this.okButton.autoSize = "none";
            this.okButton.enabled = true;
            this.okButton.focusable = false;
            this.okButton.groupName = "";
            this.okButton.label = "";
            this.okButton.overlayAlign = "none";
            this.okButton.overlayImg = "";
            this.okButton.overlayPadding = {x:0, y:0};
            this.okButton.preventAutoSize = true;
            this.okButton.selected = false;
            this.okButton.toggle = false;
            this.okButton.visible = true;
            try
            {
                this.okButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_closeButton_friendPage_tab_0()
        {
            try
            {
                this.closeButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.closeButton.autoRepeat = false;
            this.closeButton.autoSize = "none";
            this.closeButton.enabled = true;
            this.closeButton.focusable = false;
            this.closeButton.groupName = "";
            this.closeButton.label = "";
            this.closeButton.overlayAlign = "none";
            this.closeButton.overlayImg = "";
            this.closeButton.overlayPadding = {x:0, y:0};
            this.closeButton.preventAutoSize = true;
            this.closeButton.selected = false;
            this.closeButton.toggle = false;
            this.closeButton.visible = true;
            try
            {
                this.closeButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tabType_friendPage_tab_0()
        {
            try
            {
                this.tabType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tabType.autoSize = "none";
            this.tabType.buttonWidth = 110;
            this.tabType.direction = "horizontal";
            this.tabType.enabled = true;
            this.tabType.focusable = false;
            this.tabType.itemRendererName = "TabButton";
            this.tabType.preventAutoSize = true;
            this.tabType.spacing = 1;
            this.tabType.visible = true;
            try
            {
                this.tabType["componentInspectorSetting"] = false;
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
