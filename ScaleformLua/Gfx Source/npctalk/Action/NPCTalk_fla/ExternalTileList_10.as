package NPCTalk_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class ExternalTileList_10 extends MovieClip
    {
        public var mcSlotBtn16:MovieClip;
        public var mcSlotBtn4:MovieClip;
        public var item5:ListItemRenderer_Rebuy;
        public var mcSlotBtn11:MovieClip;
        public var mcSlotBtn7:MovieClip;
        public var item6:ListItemRenderer_Rebuy;
        public var mcSlotBtn10:MovieClip;
        public var mcSlotBtn6:MovieClip;
        public var item7:ListItemRenderer_Rebuy;
        public var mcSlotBtn13:MovieClip;
        public var item10:ListItemRenderer_Rebuy;
        public var item8:ListItemRenderer_Rebuy;
        public var mcSlotBtn12:MovieClip;
        public var mcSlotBtn9:MovieClip;
        public var item11:ListItemRenderer_Rebuy;
        public var item9:ListItemRenderer_Rebuy;
        public var mcSlotBtn8:MovieClip;
        public var item12:ListItemRenderer_Rebuy;
        public var item13:ListItemRenderer_Rebuy;
        public var item14:ListItemRenderer_Rebuy;
        public var item15:ListItemRenderer_Rebuy;
        public var item16:ListItemRenderer_Rebuy;
        public var mcSlotBtn1:MovieClip;
        public var item1:ListItemRenderer_Rebuy;
        public var mcSlotBtn15:MovieClip;
        public var mcSlotBtn3:MovieClip;
        public var item2:ListItemRenderer_Rebuy;
        public var mcSlotBtn14:MovieClip;
        public var mcSlotBtn2:MovieClip;
        public var item3:ListItemRenderer_Rebuy;
        public var mcSlotBtn5:MovieClip;
        public var item4:ListItemRenderer_Rebuy;
        public var list:TileList;
        public var scrollBar:ScrollBar;

        public function ExternalTileList_10()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_ExternalTileList_list_0();
            this.__setProp_scrollBar_ExternalTileList_list_0();
            return;
        }// end function

        function __setProp_list_ExternalTileList_list_0()
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
            this.list.externalColumnCount = 2;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 1;
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

        function __setProp_scrollBar_ExternalTileList_list_0()
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
