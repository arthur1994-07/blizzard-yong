package GroupChat_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class ChatPanel_1 extends MovieClip
    {
        public var link1:MovieClip;
        public var link2:MovieClip;
        public var link3:MovieClip;
        public var log:MChatLog;
        public var btnMinimize:Button;
        public var input:TextInput;
        public var btnInvite:Button;
        public var list:ScrollingList;

        public function ChatPanel_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnInvite_ChatPanel_button_0();
            this.__setProp_list_ChatPanel_button_0();
            this.__setProp_btnMinimize_ChatPanel_button_0();
            return;
        }// end function

        function __setProp_btnInvite_ChatPanel_button_0()
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

        function __setProp_list_ChatPanel_button_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = true;
            this.list.itemRendererName = "DefaultListItemRenderer";
            this.list.itemRendererInstanceName = "";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "DefaultScrollBar";
            this.list.treeButtonClassName = "";
            this.list.treeButtonGap = -1;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = false;
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnMinimize_ChatPanel_button_0()
        {
            try
            {
                this.btnMinimize["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnMinimize.autoRepeat = false;
            this.btnMinimize.autoSize = "none";
            this.btnMinimize.enabled = true;
            this.btnMinimize.focusable = false;
            this.btnMinimize.groupName = "";
            this.btnMinimize.label = "";
            this.btnMinimize.overlayAlign = "none";
            this.btnMinimize.overlayImg = "";
            this.btnMinimize.overlayPadding = {x:0, y:0};
            this.btnMinimize.preventAutoSize = false;
            this.btnMinimize.selected = false;
            this.btnMinimize.toggle = false;
            this.btnMinimize.visible = true;
            try
            {
                this.btnMinimize["componentInspectorSetting"] = false;
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
