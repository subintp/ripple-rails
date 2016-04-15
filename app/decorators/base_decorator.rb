class BaseDecorator

   protected

   def method_missing(meth, *args)
     if @object.respond_to?(meth)
       @object.send(meth, *args)
     else
       super
     end
   end

end
