int[] a = {-2,-6,-4,2,4,1};
		System.out.println("a:  "+Arrays.toString(a));
		int min=0;
		int[] b=new int[6];
//		int[]c=new int[6];
//		int[]d=new int[6];
		b[0]=a[0];
		min=a[0];
			for(int j=1;j<a.length;j++)
			{
				if(a[j]<=min)
				{
					min=a[j];
					for(int k=0;k<j;k++)
					{
						if(b[k]<=min)
						{
							for(int l=0;l<b.length;l++)
							{
								b[l+1]=b[l];
							}
							b[k]=min;
						}
						else
						{
							
						}
					}
				}
				else
				{
					b[j-1]=a[j];
				}
			}
		System.out.println("b:  "+Arrays.toString(b));