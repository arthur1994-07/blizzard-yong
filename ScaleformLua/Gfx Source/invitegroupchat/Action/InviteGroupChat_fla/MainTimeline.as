package InviteGroupChat_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var exListFriend:MovieClip;
        public var exListClub:MovieClip;
        public var tabType:ButtonBar;
        public var inputSearch:TextInput;
        public var btnSearch:Button;
        public var btnInvite:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnSearch_Scene1_Common_Button_layer_0();
            this.__setProp_btnInvite_Scene1_Common_Button_layer_0();
            this.__setProp_tabType_Scene1_ButtonBar_layer_0();
            return;
        }// end function

        function __setProp_btnSearch_Scene1_Common_Button_layer_0()
        {
            try
            {
                this.btnSearch["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSearch.autoRepeat = false;
            this.btnSearch.autoSize = "none";
            this.btnSearch.enabled = true;
            this.btnSearch.focusable = false;
            this.btnSearch.groupName = "";
            this.btnSearch.label = "";
            this.btnSearch.overlayAlign = "none";
            this.btnSearch.overlayImg = "";
            this.btnSearch.overlayPadding = {x:0, y:0};
            this.btnSearch.preventAutoSize = false;
            this.btnSearch.selected = false;
            this.btnSearch.toggle = false;
            this.btnSearch.visible = true;
            try
            {
                this.btnSearch["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnInvite_Scene1_Common_Button_layer_0()
        {
            try
            {
                this.btnInvite["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnInvite.autoRepeat = false;
            this.btnInvite.autoSize = "none";
            this.btnInvite.enabled = true;
            this.btnInvite.focusable = false;
            this.btnInvite.groupName = "";
            this.btnInvite.label = "";
            this.btnInvite.overlayAlign = "none";
            this.btnInvite.overlayImg = "";
            this.btnInvite.overlayPadding = {x:0, y:0};
            this.btnInvite.preventAutoSize = false;
            this.btnInvite.selected = false;
            this.btnInvite.toggle = false;
            this.btnInvite.visible = true;
            try
            {
                this.btnInvite["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tabType_Scene1_ButtonBar_layer_0()
        {
            try
            {
                this.tabType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tabType.autoSize = "none";
            this.tabType.buttonWidth = 60;
            this.tabType.direction = "horizontal";
            this.tabType.enabled = true;
            this.tabType.focusable = false;
            this.tabType.itemRendererName = "TabButton";
            this.tabType.preventAutoSize = false;
            this.tabType.spacing = 0;
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
