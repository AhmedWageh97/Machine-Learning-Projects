function [jVal gradient] = Cost_Function(Thata)
   global X_Data
   global Y_Data
   
   J_sum = 0;
   
   m = length(X_Data(1,:));
   
   gradient = zeros(3, 1);
   
   for i = 1 : m
       %    For Cost Function
       H = Thata' * X_Data(:,i);
       H = 1 / (1 + exp(-H));
       J_sum = J_sum + (Y_Data(i) * log(H) + (1 - Y_Data(i)) * log(1 - H));
       
       %    For Gradients
       gradient(1) = gradient(1) + (H - Y_Data(i)) * X_Data(1,i);
       gradient(2) = gradient(2) + (H - Y_Data(i)) * X_Data(2,i);
       gradient(3) = gradient(3) + (H - Y_Data(i)) * X_Data(3,i);
   end
   
   jVal = (-1 / m) * J_sum;  
   
   
end