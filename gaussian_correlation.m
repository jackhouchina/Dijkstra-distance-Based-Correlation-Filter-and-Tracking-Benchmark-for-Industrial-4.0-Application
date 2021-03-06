function kf = gaussian_correlation(xf, yf, sigma)
	
	N = size(xf,1) * size(xf,2);
	xx = xf(:)' * xf(:) / N;  
	yy = yf(:)' * yf(:) / N;  
	
	
	xyf = xf .* conj(yf);
	xy = sum(real(ifft2(xyf)), 3);  

	kf = fft2(exp(-1 / sigma^2 * max(0, (xx + yy - 2 * xy) / numel(xf))));

end

