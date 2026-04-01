package scaleform.clik.data
{
    import flash.events.*;
    import scaleform.clik.interfaces.*;

    dynamic public class DataProvider extends Array implements IDataProvider, IEventDispatcher
    {
        protected var dispatcher:EventDispatcher;

        public function DataProvider(param1:Array = null)
        {
            this.dispatcher = new EventDispatcher(this);
            this.parseSource(param1);
            return;
        }// end function

        public function indexOf(param1:Object, param2:Function = null) : int
        {
            var _loc_3:* = super.indexOf(param1);
            if (param2 != null)
            {
                this.param2(_loc_3);
            }
            return _loc_3;
        }// end function

        public function requestItemAt(param1:uint, param2:Function = null) : Object
        {
            var _loc_3:* = this[param1];
            if (param2 != null)
            {
                this.param2(_loc_3);
            }
            return _loc_3;
        }// end function

        public function requestItemRange(param1:int, param2:int, param3:Function = null) : Array
        {
            var _loc_4:* = this.slice(param1, (param2 + 1));
            if (param3 != null)
            {
                this.param3(_loc_4);
            }
            return _loc_4;
        }// end function

        public function cleanUp() : void
        {
            this.splice(0, length);
            return;
        }// end function

        public function invalidate(param1:uint = 0) : void
        {
            this.dispatcher.dispatchEvent(new Event(Event.CHANGE));
            return;
        }// end function

        public function setSource(param1:Array) : void
        {
            this.parseSource(param1);
            return;
        }// end function

        public function toString() : String
        {
            return "[CLIK DataProvider " + this.join(",") + "]";
        }// end function

        protected function parseSource(param1:Array) : void
        {
            if (param1 == null)
            {
                return;
            }
            var _loc_2:* = param1.length;
            var _loc_3:* = 0;
            while (_loc_3 < _loc_2)
            {
                
                this[_loc_3] = param1[_loc_3];
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            this.dispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            this.dispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return this.dispatcher.dispatchEvent(event);
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return this.dispatcher.hasEventListener(param1);
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return this.dispatcher.willTrigger(param1);
        }// end function

    }
}
