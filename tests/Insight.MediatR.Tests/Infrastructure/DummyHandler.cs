﻿using System.Threading;
using System.Threading.Tasks;
using MediatR;

namespace Insight.MediatR.Tests.Infrastructure
{
	public sealed class DummyHandler : IRequestHandler<DummyCommand, bool>
	{
		public Task<bool> Handle(DummyCommand request, CancellationToken cancellationToken)
		{
			return Task.FromResult(true);
		}
	}
}