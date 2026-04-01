package PetSkill_fla
{
    import flash.display.*;
    import ran.ui.slot.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var scrollBar:DefaultScrollBar;
        public var buttonBar:DefaultButtonBar;
        public var list:DefaultTileList;
        public var item1:DefaultListItemRenderer;
        public var item2:DefaultListItemRenderer;
        public var item3:DefaultListItemRenderer;
        public var item4:DefaultListItemRenderer;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_Scene1_Layer2_0();
            this.__setProp_buttonBar_Scene1_Layer1_0();
            this.__setProp_scrollBar_Scene1_Layer1_0();
            return;
        }// end function

        function __setProp_list_Scene1_Layer2_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.columnWidth = 0;
            this.list.direction = "vertical";
            this.list.enabled = true;
            this.list.externalColumnCount = 1;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "";
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

        function __setProp_buttonBar_Scene1_Layer1_0()
        {
            try
            {
                this.buttonBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.buttonBar.autoSize = "none";
            this.buttonBar.buttonWidth = 0;
            this.buttonBar.direction = "horizontal";
            this.buttonBar.enabled = true;
            this.buttonBar.everyFrameUpdate = false;
            this.buttonBar.focusable = false;
            this.buttonBar.itemRendererName = "AnimatedToggleButton";
            this.buttonBar.spacing = 0;
            this.buttonBar.visible = true;
            try
            {
                this.buttonBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBar_Scene1_Layer1_0()
        {
            try
            {
                this.scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBar.enabled = true;
            this.scrollBar.minThumbSize = 10;
            this.scrollBar.offsetBottom = 0;
            this.scrollBar.offsetTop = 0;
            this.scrollBar.scrollTarget = "list";
            this.scrollBar.trackMode = "scrollPage";
            this.scrollBar.visible = true;
            try
            {
                this.scrollBar["componentInspectorSetting"] = false;
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
