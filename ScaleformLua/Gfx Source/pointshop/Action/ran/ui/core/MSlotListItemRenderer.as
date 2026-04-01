package ran.ui.core
{
    import flash.events.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    public class MSlotListItemRenderer extends ListItemRenderer
    {
        protected var _slot:Slot;

        public function MSlotListItemRenderer()
        {
            addEventListener(MouseEvent.ROLL_OVER, this.onRollOver, false, 0, true);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOut, false, 0, true);
            return;
        }// end function

        public function get slotName() : String
        {
            return this._slot != null ? (this._slot.name) : ("");
        }// end function

        public function set slotName(param1:String) : void
        {
            var _loc_2:* = parent.getChildByName(param1) as Slot;
            if (_loc_2 == null)
            {
                return;
            }
            this._slot = _loc_2;
            return;
        }// end function

        protected function onRollOver(event:MouseEvent) : void
        {
            if (this._slot == null)
            {
                return;
            }
            this._slot.dispatchEvent(event);
            return;
        }// end function

        protected function onRollOut(event:MouseEvent) : void
        {
            if (this._slot == null)
            {
                return;
            }
            this._slot.dispatchEvent(event);
            return;
        }// end function

    }
}
