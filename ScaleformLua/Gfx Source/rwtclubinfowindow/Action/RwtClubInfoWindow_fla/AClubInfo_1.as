package RwtClubInfoWindow_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class AClubInfo_1 extends MovieClip
    {
        public var rwtAName:TextField;
        public var rwtAClubNameBg:MovieClip;
        public var list:MMaskedList;
        public var labelrwtCharName:Label;
        public var labelrwtLv:Label;
        public var labelrwtKill:Label;
        public var labelrwtDeath:Label;

        public function AClubInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_AClubInfo_list_0();
            return;
        }// end function

        function __setProp_list_AClubInfo_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.itemRendererName = "ListItemRenderer_ClubInfo";
            this.list.itemRendererOffset = {x:0, y:0};
            this.list.multiSelectable = false;
            this.list.rowCount = 1;
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

        function frame1()
        {
            return;
        }// end function

    }
}
