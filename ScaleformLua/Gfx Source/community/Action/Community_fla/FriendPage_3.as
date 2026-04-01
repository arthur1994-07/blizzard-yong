package Community_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class FriendPage_3 extends MovieClip
    {
        public var popupGroup:MovieClip;
        public var popupFriend:MovieClip;
        public var count:Label;
        public var groupCount:Label;
        public var type:Label;
        public var dropDown:DropdownMenu;
        public var friendInput:TextInput;
        public var addFriend:Button;
        public var addGroup:Button;
        public var list:MMaskedTreeList;

        public function FriendPage_3()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_addFriend_FriendPage_button_0();
            this.__setProp_addGroup_FriendPage_button_0();
            this.__setProp_count_FriendPage_count_0();
            this.__setProp_groupCount_FriendPage_count_0();
            this.__setProp_type_FriendPage_count_0();
            this.__setProp_list_FriendPage_tilelist_0();
            this.__setProp_dropDown_FriendPage_DropDown_0();
            return;
        }// end function

        function __setProp_addFriend_FriendPage_button_0()
        {
            try
            {
                this.addFriend["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.addFriend.autoRepeat = false;
            this.addFriend.autoSize = "none";
            this.addFriend.enabled = true;
            this.addFriend.focusable = false;
            this.addFriend.groupName = "";
            this.addFriend.label = "";
            this.addFriend.overlayAlign = "none";
            this.addFriend.overlayImg = "";
            this.addFriend.overlayPadding = {x:0, y:0};
            this.addFriend.selected = false;
            this.addFriend.toggle = false;
            this.addFriend.visible = true;
            try
            {
                this.addFriend["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_addGroup_FriendPage_button_0()
        {
            try
            {
                this.addGroup["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.addGroup.autoRepeat = false;
            this.addGroup.autoSize = "none";
            this.addGroup.enabled = true;
            this.addGroup.focusable = false;
            this.addGroup.groupName = "";
            this.addGroup.label = "";
            this.addGroup.overlayAlign = "none";
            this.addGroup.overlayImg = "";
            this.addGroup.overlayPadding = {x:0, y:0};
            this.addGroup.selected = false;
            this.addGroup.toggle = false;
            this.addGroup.visible = true;
            try
            {
                this.addGroup["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_count_FriendPage_count_0()
        {
            try
            {
                this.count["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.count.autoSize = "left";
            this.count.autoSizeEnable = false;
            this.count.enabled = true;
            this.count.text = "";
            this.count.visible = true;
            try
            {
                this.count["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_groupCount_FriendPage_count_0()
        {
            try
            {
                this.groupCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.groupCount.autoSize = "center";
            this.groupCount.autoSizeEnable = false;
            this.groupCount.enabled = true;
            this.groupCount.text = "";
            this.groupCount.visible = true;
            try
            {
                this.groupCount["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_type_FriendPage_count_0()
        {
            try
            {
                this.type["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.type.autoSize = "right";
            this.type.autoSizeEnable = false;
            this.type.enabled = true;
            this.type.text = "";
            this.type.visible = true;
            try
            {
                this.type["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_FriendPage_tilelist_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.headRendererName = "FriendMaskedHeadRenderer";
            this.list.itemRendererName = "FriendMaskedItemRenderer";
            this.list.itemRendererOffsetY = 0;
            this.list.scrollBarName = "NewScrollBar";
            this.list.scrollSpeed = 10;
            this.list.visible = true;
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dropDown_FriendPage_DropDown_0()
        {
            try
            {
                this.dropDown["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.dropDown.autoSize = "none";
            this.dropDown.dropdown = "DefaultScrollingList";
            this.dropDown.enabled = true;
            this.dropDown.focusable = false;
            this.dropDown.groupName = "";
            this.dropDown.itemRenderer = "DefaultListItemRenderer";
            this.dropDown.menuDirection = "down";
            this.dropDown.menuMargin = 0;
            this.dropDown.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.dropDown.inspectableMenuPadding = {top:-1, right:0, bottom:-1, left:0};
            this.dropDown.menuRowCount = 2;
            this.dropDown.menuRowsFixed = true;
            this.dropDown.menuWidth = -1;
            this.dropDown.menuWrapping = "normal";
            this.dropDown.overlayAlign = "none";
            this.dropDown.overlayImg = "";
            this.dropDown.overlayPadding = {x:0, y:0};
            this.dropDown.scrollBar = "";
            this.dropDown.inspectableThumbOffset = {top:0, bottom:0};
            this.dropDown.visible = true;
            try
            {
                this.dropDown["componentInspectorSetting"] = false;
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
