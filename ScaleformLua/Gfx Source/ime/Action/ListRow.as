package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;

    public class ListRow extends MovieClip
    {
        public var bkGround_mc:MovieClip;
        public var RowNumberBackground_mc:MovieClip;
        public var currentState:String = "UnSelected";
        public var Value:TextField;
        public var ID:TextField;
        public var controller:Object;

        public function ListRow(param1:Object)
        {
            addFrameScript(0, frame1);
            controller = param1;
            addEventListener(MouseEvent.MOUSE_DOWN, pressHandler);
            addEventListener(MouseEvent.MOUSE_UP, releaseHandler);
            return;
        }// end function

        function pressHandler(event:MouseEvent)
        {
            MovieClip(parent).ClickedOnCandidateList = true;
            controller.SelectItem(this.name);
            return;
        }// end function

        function releaseHandler(event:MouseEvent)
        {
            return;
        }// end function

        public function GotoOffState()
        {
            var _loc_1:* = null;
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            if (bkGround_mc != null)
            {
                controller.DisplayInfo(name);
                _loc_1 = Value.getTextFormat();
                _loc_1.color = 16777215;
                _loc_1.size = 12;
                _loc_2 = 0;
                bkGround_mc.transform.colorTransform = new ColorTransform(0, 0, 0, 1, (_loc_2 & 16711680) >> 16, (_loc_2 & 65280) >> 8, _loc_2 & 255, 0);
                _loc_3 = 1973790;
                RowNumberBackground_mc.transform.colorTransform = new ColorTransform(0, 0, 0, 1, (_loc_3 & 16711680) >> 16, (_loc_3 & 65280) >> 8, _loc_3 & 255, 0);
                Value.setTextFormat(_loc_1);
                ID.setTextFormat(_loc_1);
            }
            currentState = "UnSelected";
            return;
        }// end function

        public function GotoOnState()
        {
            var _loc_1:* = null;
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            if (bkGround_mc != null)
            {
                controller.DisplayInfo(name);
                _loc_1 = Value.getTextFormat();
                _loc_1.color = 16776960;
                _loc_1.size = 12;
                _loc_2 = 1973790;
                bkGround_mc.transform.colorTransform = new ColorTransform(0, 0, 0, 1, (_loc_2 & 16711680) >> 16, (_loc_2 & 65280) >> 8, _loc_2 & 255, 0);
                _loc_3 = 1973790;
                RowNumberBackground_mc.transform.colorTransform = new ColorTransform(0, 0, 0, 1, (_loc_3 & 16711680) >> 16, (_loc_3 & 65280) >> 8, _loc_3 & 255, 0);
                Value.setTextFormat(_loc_1);
                ID.setTextFormat(_loc_1);
            }
            currentState = "Selected";
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
