package HotKeyConfig_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var config:MovieClip;
        public var btnDefault:Button;
        public var btnApply:Button;
        public var btnOK:Button;
        public var tabPage:ButtonBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tabPage_Scene1_button_0();
            this.__setProp_btnDefault_Scene1_button_0();
            this.__setProp_btnApply_Scene1_button_0();
            this.__setProp_btnOK_Scene1_button_0();
            return;
        }// end function

        function __setProp_tabPage_Scene1_button_0()
        {
            try
            {
                this.tabPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tabPage.autoSize = "none";
            this.tabPage.buttonWidth = 80;
            this.tabPage.direction = "horizontal";
            this.tabPage.enabled = true;
            this.tabPage.focusable = false;
            this.tabPage.itemRendererName = "TabButton";
            this.tabPage.preventAutoSize = false;
            this.tabPage.spacing = 0;
            this.tabPage.visible = true;
            try
            {
                this.tabPage["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDefault_Scene1_button_0()
        {
            try
            {
                this.btnDefault["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDefault.autoRepeat = false;
            this.btnDefault.autoSize = "none";
            this.btnDefault.enabled = true;
            this.btnDefault.focusable = false;
            this.btnDefault.groupName = "";
            this.btnDefault.label = "";
            this.btnDefault.overlayAlign = "none";
            this.btnDefault.overlayImg = "";
            this.btnDefault.overlayPadding = {x:0, y:0};
            this.btnDefault.preventAutoSize = false;
            this.btnDefault.selected = false;
            this.btnDefault.toggle = false;
            this.btnDefault.visible = true;
            try
            {
                this.btnDefault["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnApply_Scene1_button_0()
        {
            try
            {
                this.btnApply["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnApply.autoRepeat = false;
            this.btnApply.autoSize = "none";
            this.btnApply.enabled = true;
            this.btnApply.focusable = false;
            this.btnApply.groupName = "";
            this.btnApply.label = "";
            this.btnApply.overlayAlign = "none";
            this.btnApply.overlayImg = "";
            this.btnApply.overlayPadding = {x:0, y:0};
            this.btnApply.preventAutoSize = false;
            this.btnApply.selected = false;
            this.btnApply.toggle = false;
            this.btnApply.visible = true;
            try
            {
                this.btnApply["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOK_Scene1_button_0()
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
