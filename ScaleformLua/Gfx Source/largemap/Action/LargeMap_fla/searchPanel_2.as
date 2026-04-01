package LargeMap_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class searchPanel_2 extends MovieClip
    {
        public var labelSearch:Label;
        public var labelInfo:Label;
        public var labelInfo1:Label;
        public var labelInfo2:Label;
        public var labelInfo3:Label;
        public var labelInfo4:Label;
        public var labelInfo5:Label;
        public var labelInfo6:Label;
        public var labelSchool:Label;
        public var labelName:Label;
        public var labelBadge:Label;
        public var labelClass:Label;
        public var labelParty:Label;
        public var labelClub:Label;
        public var checkCurrentMap:CheckBox;
        public var checkCurrentMap_text:Label;
        public var inputSearch:TextInput;
        public var btnSearch:Button;
        public var btnDisplay:Button;
        public var btnWhisper:Button;
        public var btnFriend:Button;
        public var btnInfo:Button;
        public var btnParty:Button;
        public var btnClub:Button;
        public var listChar:ScrollingList;

        public function searchPanel_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_listChar_searchPanel_asset_0();
            this.__setProp_btnDisplay_searchPanel_asset_0();
            this.__setProp_btnWhisper_searchPanel_asset_0();
            this.__setProp_btnFriend_searchPanel_asset_0();
            this.__setProp_btnInfo_searchPanel_asset_0();
            this.__setProp_btnParty_searchPanel_asset_0();
            this.__setProp_btnClub_searchPanel_asset_0();
            this.__setProp_btnSearch_searchPanel_asset_0();
            return;
        }// end function

        function __setProp_listChar_searchPanel_asset_0()
        {
            try
            {
                this.listChar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listChar.enabled = true;
            this.listChar.focusable = true;
            this.listChar.itemRendererName = "ListItemRenderer_h20";
            this.listChar.itemRendererInstanceName = "";
            this.listChar.margin = 0;
            this.listChar.multiSelect = false;
            this.listChar.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listChar.rowHeight = 0;
            this.listChar.scrollBar = "DefaultScrollBar";
            this.listChar.treeButtonClassName = "";
            this.listChar.treeButtonGap = -1;
            this.listChar.treeCheckBoxClassName = "";
            this.listChar.treeList = false;
            this.listChar.visible = true;
            this.listChar.wrapping = "normal";
            try
            {
                this.listChar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDisplay_searchPanel_asset_0()
        {
            try
            {
                this.btnDisplay["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDisplay.autoRepeat = false;
            this.btnDisplay.autoSize = "none";
            this.btnDisplay.enabled = true;
            this.btnDisplay.focusable = false;
            this.btnDisplay.groupName = "";
            this.btnDisplay.label = "";
            this.btnDisplay.overlayAlign = "none";
            this.btnDisplay.overlayImg = "";
            this.btnDisplay.overlayPadding = {x:0, y:0};
            this.btnDisplay.preventAutoSize = true;
            this.btnDisplay.selected = false;
            this.btnDisplay.toggle = false;
            this.btnDisplay.visible = true;
            try
            {
                this.btnDisplay["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnWhisper_searchPanel_asset_0()
        {
            try
            {
                this.btnWhisper["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnWhisper.autoRepeat = false;
            this.btnWhisper.autoSize = "none";
            this.btnWhisper.enabled = true;
            this.btnWhisper.focusable = false;
            this.btnWhisper.groupName = "";
            this.btnWhisper.label = "";
            this.btnWhisper.overlayAlign = "none";
            this.btnWhisper.overlayImg = "";
            this.btnWhisper.overlayPadding = {x:0, y:0};
            this.btnWhisper.preventAutoSize = true;
            this.btnWhisper.selected = false;
            this.btnWhisper.toggle = false;
            this.btnWhisper.visible = true;
            try
            {
                this.btnWhisper["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend_searchPanel_asset_0()
        {
            try
            {
                this.btnFriend["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend.autoRepeat = false;
            this.btnFriend.autoSize = "none";
            this.btnFriend.enabled = true;
            this.btnFriend.focusable = false;
            this.btnFriend.groupName = "";
            this.btnFriend.label = "";
            this.btnFriend.overlayAlign = "none";
            this.btnFriend.overlayImg = "";
            this.btnFriend.overlayPadding = {x:0, y:0};
            this.btnFriend.preventAutoSize = true;
            this.btnFriend.selected = false;
            this.btnFriend.toggle = false;
            this.btnFriend.visible = true;
            try
            {
                this.btnFriend["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnInfo_searchPanel_asset_0()
        {
            try
            {
                this.btnInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnInfo.autoRepeat = false;
            this.btnInfo.autoSize = "none";
            this.btnInfo.enabled = true;
            this.btnInfo.focusable = false;
            this.btnInfo.groupName = "";
            this.btnInfo.label = "";
            this.btnInfo.overlayAlign = "none";
            this.btnInfo.overlayImg = "";
            this.btnInfo.overlayPadding = {x:0, y:0};
            this.btnInfo.preventAutoSize = true;
            this.btnInfo.selected = false;
            this.btnInfo.toggle = false;
            this.btnInfo.visible = true;
            try
            {
                this.btnInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnParty_searchPanel_asset_0()
        {
            try
            {
                this.btnParty["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnParty.autoRepeat = false;
            this.btnParty.autoSize = "none";
            this.btnParty.enabled = true;
            this.btnParty.focusable = false;
            this.btnParty.groupName = "";
            this.btnParty.label = "";
            this.btnParty.overlayAlign = "none";
            this.btnParty.overlayImg = "";
            this.btnParty.overlayPadding = {x:0, y:0};
            this.btnParty.preventAutoSize = true;
            this.btnParty.selected = false;
            this.btnParty.toggle = false;
            this.btnParty.visible = true;
            try
            {
                this.btnParty["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnClub_searchPanel_asset_0()
        {
            try
            {
                this.btnClub["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnClub.autoRepeat = false;
            this.btnClub.autoSize = "none";
            this.btnClub.enabled = true;
            this.btnClub.focusable = false;
            this.btnClub.groupName = "";
            this.btnClub.label = "";
            this.btnClub.overlayAlign = "none";
            this.btnClub.overlayImg = "";
            this.btnClub.overlayPadding = {x:0, y:0};
            this.btnClub.preventAutoSize = true;
            this.btnClub.selected = false;
            this.btnClub.toggle = false;
            this.btnClub.visible = true;
            try
            {
                this.btnClub["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSearch_searchPanel_asset_0()
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
            this.btnSearch.preventAutoSize = true;
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

        function frame1()
        {
            return;
        }// end function

    }
}
