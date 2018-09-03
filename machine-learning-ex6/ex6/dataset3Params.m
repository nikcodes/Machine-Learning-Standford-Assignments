function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

cc = [0.01 0.03 0.1 0.3 1 3 10 30];
ss = [0.01 0.03 0.1 0.3 1 3 10 30];
acc=0;
val_size=size(Xval,1);

for i=1:8
	cvalue=cc(i);
	for j=1:8
		svalue=ss(j);
		model= svmTrain(X, y, cvalue, @(x1, x2) gaussianKernel(x1, x2, svalue)); 

		h = svmPredict(model,Xval);
		hmod = h>=.5;
		final = hmod==yval;
		accuracy = sum(final)/val_size;

		if accuracy>acc
			acc=accuracy;
			C=cvalue;
			sigma=svalue;
		end

	end
		
	
end





% =========================================================================

end
