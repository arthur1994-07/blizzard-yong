package Community_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class FriendPagePopupMain_6 extends MovieClip
    {
        public var item1:ListItemRenderer;
        public var item2:ListItemRenderer;
        public var item3:ListItemRenderer;
        public var item4:ListItemRenderer;
        public var item5:ListItemRenderer;
        public var item6:ListItemRenderer;
        public var item7:ListItemRenderer;
        public var item8:ListItemRenderer;
        public var list:TileList;

        public function FriendPagePopupMain_6()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_FriendPagePopupMain_renderer_0();
            return;
        }// end function

        function __setProp_list_FriendPagePopupMain_renderer_0()
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
            this.list.externalColumnCount = 0;
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

        function frame1()
        {
            return;
        }// end function

    }
}
