package Pet_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var PetSlot:MovieClip;
        public var infoSatiation:MovieClip;
        public var LabelName:Label;
        public var LabelType:Label;
        public var LabelSatiety:Label;
        public var LabelPetName:Label;
        public var LabelPetType:Label;
        public var ListA:DropdownMenu;
        public var ListB:DropdownMenu;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_LabelPetName_Scene1_asset_0();
            this.__setProp_LabelPetType_Scene1_asset_0();
            this.__setProp_ListA_Scene1_asset_0();
            this.__setProp_ListB_Scene1_asset_0();
            this.__setProp_LabelName_Scene1_asset_0();
            this.__setProp_LabelType_Scene1_asset_0();
            this.__setProp_LabelSatiety_Scene1_asset_0();
            return;
        }// end function

        function __setProp_LabelPetName_Scene1_asset_0()
        {
            try
            {
                this.LabelPetName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LabelPetName.autoSize = "none";
            this.LabelPetName.enabled = true;
            this.LabelPetName.text = "label";
            this.LabelPetName.visible = true;
            try
            {
                this.LabelPetName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LabelPetType_Scene1_asset_0()
        {
            try
            {
                this.LabelPetType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LabelPetType.autoSize = "none";
            this.LabelPetType.enabled = true;
            this.LabelPetType.text = "label";
            this.LabelPetType.visible = true;
            try
            {
                this.LabelPetType["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ListA_Scene1_asset_0()
        {
            try
            {
                this.ListA["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ListA.autoSize = "none";
            this.ListA.dropdown = "DefaultScrollingList";
            this.ListA.enabled = true;
            this.ListA.focusable = false;
            this.ListA.groupName = "";
            this.ListA.itemRenderer = "DefaultListItemRenderer";
            this.ListA.menuDirection = "down";
            this.ListA.menuMargin = 1;
            this.ListA.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.ListA.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.ListA.menuRowCount = 5;
            this.ListA.menuRowsFixed = true;
            this.ListA.menuWidth = -1;
            this.ListA.menuWrapping = "normal";
            this.ListA.overlayAlign = "none";
            this.ListA.overlayImg = "";
            this.ListA.overlayPadding = {x:0, y:0};
            this.ListA.preventAutoSize = true;
            this.ListA.scrollBar = "DefaultScrollBar";
            this.ListA.inspectableThumbOffset = {top:0, bottom:0};
            this.ListA.visible = true;
            try
            {
                this.ListA["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ListB_Scene1_asset_0()
        {
            try
            {
                this.ListB["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ListB.autoSize = "none";
            this.ListB.dropdown = "DefaultScrollingList";
            this.ListB.enabled = true;
            this.ListB.focusable = false;
            this.ListB.groupName = "";
            this.ListB.itemRenderer = "DefaultListItemRenderer";
            this.ListB.menuDirection = "down";
            this.ListB.menuMargin = 1;
            this.ListB.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.ListB.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.ListB.menuRowCount = 5;
            this.ListB.menuRowsFixed = true;
            this.ListB.menuWidth = -1;
            this.ListB.menuWrapping = "normal";
            this.ListB.overlayAlign = "none";
            this.ListB.overlayImg = "";
            this.ListB.overlayPadding = {x:0, y:0};
            this.ListB.preventAutoSize = true;
            this.ListB.scrollBar = "DefaultScrollBar";
            this.ListB.inspectableThumbOffset = {top:0, bottom:0};
            this.ListB.visible = true;
            try
            {
                this.ListB["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LabelName_Scene1_asset_0()
        {
            try
            {
                this.LabelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LabelName.autoSize = "none";
            this.LabelName.enabled = true;
            this.LabelName.text = "label";
            this.LabelName.visible = true;
            try
            {
                this.LabelName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LabelType_Scene1_asset_0()
        {
            try
            {
                this.LabelType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LabelType.autoSize = "none";
            this.LabelType.enabled = true;
            this.LabelType.text = "label";
            this.LabelType.visible = true;
            try
            {
                this.LabelType["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LabelSatiety_Scene1_asset_0()
        {
            try
            {
                this.LabelSatiety["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LabelSatiety.autoSize = "none";
            this.LabelSatiety.enabled = true;
            this.LabelSatiety.text = "label";
            this.LabelSatiety.visible = true;
            try
            {
                this.LabelSatiety["componentInspectorSetting"] = false;
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
